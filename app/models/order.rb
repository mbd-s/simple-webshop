# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items, inverse_of: :order, dependent: :destroy
  has_many :products, through: :line_items
  belongs_to :customer
  accepts_nested_attributes_for :line_items, :customer, :products

  validates_presence_of :line_items, :delivery_method

  enum status: {
    submitted: 'submitted',
    paid: 'paid',
    completed: 'completed'
  }

  enum delivery_method: {
    pickup: 'pickup',
    delivery: 'delivery'
  }

  def total_price
    line_items.map(&:subtotal).reduce(:+)
  end
end
