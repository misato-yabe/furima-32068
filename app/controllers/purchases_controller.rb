class PurchasesController < ApplicationController
  def index
    @user_purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      @user_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchase_params
    params.require(:user_purchase)
    .permit(:user_id, :item_id,:postcode, :prefecture_id, :city, :block, :building, :tell)
  end

end
