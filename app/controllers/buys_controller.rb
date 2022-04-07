class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_partner = BuyPartner.new
  end

  def create
    @buy_partner = BuyPartner.new(buy_params)
    @item = Item.find(params[:item_id])
    if @buy_partner.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,  
        card: buy_params[:token],   
        currency: 'jpy'                 
      )
     @buy_partner.save
     redirect_to root_path
    else
      render :index
    end
  end

  private
   
  def buy_params
    params.require(:buy_partner).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id:params[:item_id], token: params[:token])
  end
end
