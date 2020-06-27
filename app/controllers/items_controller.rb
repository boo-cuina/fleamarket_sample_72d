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
