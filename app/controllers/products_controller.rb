class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @product = Product.includes(:purchase).order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @product.user_id
      redirect_to :index
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :new
    end
  end

  def destroy
    if current_user.id == @product.user_id
      @product.destroy
    else
    render :index
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:image, :name, :discription, :category_id, :status_id, :delivery_chaege_id, :shipping_area_id, :shipping_day_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
