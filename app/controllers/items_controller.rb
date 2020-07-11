class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def confirm
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :size, :status, :price, :shipping_fee, :shippingfrom_id, :shipping_days, :buyer_id, :category_id, :created_at, :updated_at).merge(user_id: current_user.id)
  end

end
