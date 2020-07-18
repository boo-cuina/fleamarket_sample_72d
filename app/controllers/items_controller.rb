class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:destroy,:update]
  before_action :move_to_index, only: []

  def index
  end

  def new
    @item = Item.new
    @item.photos.new
  end

  def create
    @item.create(post_params)
  end

  def show
    @first_photo = @item.photos[0]
    @photos = @item.photos.all
    @seller_address = @item.seller.addresses[0]
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(post_params)
      redirect_to "/items/#{@item.id}"
    else
      render :edit
    end
  end

  def confirm
  end

  private
  def post_params
    params.require(:item).permit(:name,:description,:size,:status,:price,:shipping_fee,:shippingfrom_id,:shipping_days,
                                 photos_attributes: [:image]).merge(seller_id: current_user.id,category_id: params[:category_id])
  end

  def set_item
    @item = Item.find(params[:id]) 
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && @item.seller.id == current_user.id 
  end
end
