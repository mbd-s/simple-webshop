# frozen_string_literal: true

module OrdersHelper
  def delivery_methods
    Order.delivery_methods.keys
  end
end
