class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:destroy,:update]

  def index
  end

  def new
    @item = Item.new
  end

  def create
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
    if @item.update
      redirect_to root_path
    else
      render :edit
    end
  end

  def confirm
  end

  private
  def set_item
    @item = Item.find(params[:id]) 
  end
end
