class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @purchase = PurchaseAddress.new
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user.id == @product.user_id
  end

  def create
    @purchase = PurchaseAddress.new(purchase_address)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render 'new'
    end
  end

  private

  def purchase_address
    params.require(:purchase_address).permit(:post_cord, :prefecture_id, :city, :block, :building, :phone_number, :purchase).merge(user: current_user.id, product: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @product = Product.find(params[:product_id])
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_address[:token],
      currency: 'jpy'
    )
  end
end
