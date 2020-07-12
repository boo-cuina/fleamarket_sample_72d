class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.photos.new
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render :new
    end
  end

  def shows
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
      :shipping_fee, :shippingfrom_id, :shipping_days, 
      photos_attributes: [:image]).merge(seller_id: current_user.id)
  end

end
