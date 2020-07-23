class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:destroy,:update]
  before_action :move_to_index, only: [:edit,:destroy,:update]

  def index
    @items = Item.includes(:photos).order('created_at DESC')

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

  def show
    @first_photo = @item.photos[0]
    @photos = @item.photos.all
  end

  def edit
    @item.photos
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(update_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def confirm
  end

  private

  def update_params
    params.require(:item).permit(:name,:description,:size,:status,:price,:shipping_fee,:shippingfrom_id,:shipping_days,
                                 photos_attributes: [:id,:image,:_destory]).merge(seller_id: current_user.id)
  end
  def item_params
    params.require(:item).permit(:name, :description, :size, :status, :price, 
      :shipping_fee, :shippingfrom_id, :shipping_days, 
      photos_attributes: [:image]).merge(seller_id: current_user.id)

  end

  def set_item
    @item = Item.find(params[:id]) 
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && @item.seller.id == current_user.id 
  end
end
