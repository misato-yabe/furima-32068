class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[:edit,:new]
  before_action :set_item,only:[:show,:edit,:update,:destroy]
  before_action :move_to_index, only: [:edit, :destroy]


  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item)
          .permit(:title, :text, :price, :genre_id, :condition_id, :postage_id, :prefecture_id, :schedule_id,:image)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
