class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create

    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = @item.user_id
      render :new
    end
  end

  private

  def item_params
    params.require(:item)
          .permit(:title, :text, :price, :genre_id, :condition_id, :postage_id, :prefecture_id, :schedule_id,:image)
          .merge(user_id: current_user.id)
  end
end
