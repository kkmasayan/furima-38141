class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:user]
  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit( :name, :description, :status_condition_id, :prefecture_id, :shipping_charges_id, :shipping_days_id, :shipping_price, :user_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
