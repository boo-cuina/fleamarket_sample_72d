class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
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
  def
    params.require(:item).permit(:name, :description, :size, :status, :price, :shipping_fee, :shippingfrom, :shipping_days, :buyer, :seller, :category)
  end

end
