# frozen_string_literal: true

require 'byebug'
class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update(price: params[:price])
    render json: @product
  end

  def total_price
    products = Product.all
    sum = 0
    params[:items].uniq.each do |item|
    byebug
      product_price = products.find_by_code(item).price.to_i
      count = params[:items].count(item)

      sum += product_price * count
      sum -= ((product_price * 30).to_f / 100) * count if count >= 3 && item == 'TSHIRT'
      sum -= product_price * (count / 2) if count > 2 && item == 'MUG'
    end
    render json: sum
  end
end
