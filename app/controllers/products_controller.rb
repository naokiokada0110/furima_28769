class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new]

  def index
  end

  def new
  end

  def create
  end

  private

  def product_params
    params.require(:product).parmit(:image, :name, :description, :category, :status, :delivery_charge, :shipping_area, :shipping_day, :price, :user).merge(user_id: current_user.id)
  end
end
