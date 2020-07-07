class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.photos.new
  end

  def create
    Item.create(item_params)
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

  private
  def item_params
    params.require(:item).permit(:name, :description, :size, :status, :price, 
      :shipping_fee, :shippingfrom, :shipping_days, :category, 
      photos_attributes: [:image]).merge(seller_id: current_user.id)
  end

end
