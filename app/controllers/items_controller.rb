class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
    @item = Item.find(params[:id]) 
    @first_photo = @item.photos.find(1)
    @second_photo = @item.photos.find(2)
    @third_photo = @item.photos.find(3)
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def confirm
  end
end
