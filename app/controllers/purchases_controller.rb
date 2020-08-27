class PurchasesController < ApplicationController

  def new
    @purchase = PurchaseAddress.new
    @product = Product.find(params[:product_id])
  end

  def create
    @purchase = PurchaseAddress.new(purchase_address)
  end

  private

  def purchase_address
    params.requir().permit(:user, :product, :post_cord, :prefecture_id, :city, :block, :building, :phone_number, :purchase)
  end
end
