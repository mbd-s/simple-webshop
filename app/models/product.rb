# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items

  validates_presence_of :price, :name, :category
  validates :name, uniqueness: { case_sensitive: false }

  enum category: {
    bread: 'bread',
    pastry: 'pastry',
    cake: 'cake',
    biscuits_and_cookies: 'biscuits & cookies',
    pantry: 'pantry'
  }
end
