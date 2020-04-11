# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]
  http_basic_authenticate_with name: 'todo', password: 'changeme'

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def edit; end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :category)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
