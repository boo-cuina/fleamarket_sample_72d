class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:destroy,:update]
  before_action :move_to_index, only: [:edit,:destroy,:update]

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
    @item.update!(update_params)
  #   if @item.update(update_params)
  #     redirect_to "/items/#{@item.id}"
  #   else
  #     render :edit
  #   end
  end

  def confirm
  end

  private
  def update_params
    params.require(:item).permit(:name,:description,:size,:status,:price,:shipping_fee,:shippingfrom_id,:shipping_days,
                                 photos_attributes: [:id,:image,:_destory]).merge(seller_id: current_user.id,category_id: params[:category_id])
  end

  def set_item
    @item = Item.find(params[:id]) 
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && @item.seller.id == current_user.id 
  end
end
