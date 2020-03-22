# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  accepts_nested_attributes_for :product

  def subtotal
    product.price * quantity
  end
end
