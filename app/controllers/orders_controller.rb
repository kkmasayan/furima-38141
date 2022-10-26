class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @buyer_payment = BuyerPayment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_payment = BuyerPayment.new(payment_params)
    if @buyer_payment.valid?
      pay_item
      @buyer_payment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def payment_params
    params.require(:buyer_payment).permit(:post_number, :prefecture_id, :city, :address, :building_name, :tell_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.buyer.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.shipping_price,
      card: payment_params[:token],
      currency: 'jpy'
    )
  end
end
