# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[edit update]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @products = Product.all
    @order.build_customer
    @order.products.build
  end

  def create
    @order = Order.new(order_params.slice(:note, :delivery_method))
    @order.build_customer(order_params[:customer_attributes])
    @order.line_items.build(line_item_params)
    @order.save!
    redirect_to '/confirmation'
  end

  def edit; end

  def update
    # TODO: Fix params
    @order.update(order_params)
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order)
          .permit(
            :note, :delivery_method,
            customer_attributes: %i[address email name telephone],
            products_attributes: [:id, line_items: [:quantity]]
          )
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def line_item_attributes
    order_params[:products_attributes].values.reject do |product_attributes|
      product_attributes['line_items']['quantity'].blank?
    end.pluck(:id, :line_items)
  end

  def line_item_params
    line_item_attributes.map do |attrs|
      { product_id: attrs.first, quantity: attrs.last[:quantity] }
    end
  end
end
