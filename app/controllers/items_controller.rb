class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:destroy,:update]
  before_action :move_to_index, only: [:edit,:destroy,:update]
  before_action :set_category, only: [:new,:edit]
  def get_category_children
    @category_children =  Category.find("#{params[:parent_name]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def index
    @items = Item.includes(:photos).order('created_at DESC')

  end

  def new
    @item = Item.new
    @item.photos.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render :new
    end
  end

  def show
    @first_photo = @item.photos[0]
    @photos = @item.photos.all
    @product = Item.find(params[:id])
    @parents = Category.all

  end

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end

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
    params.require(:item).permit(:name, :description, :size, :status, :price, 
      :shipping_fee, :shippingfrom_id, :shipping_days, :category_id,photos_attributes: [:id,:image,:_destory]).merge(seller_id: current_user.id)
  end
  def item_params
    params.require(:item).permit(:name, :description, :size, :status, :price, 
      :shipping_fee, :shippingfrom_id, :shipping_days, :category_id,
      photos_attributes: [:image]).merge(seller_id: current_user.id)

  end

  def set_item
    @item = Item.find(params[:id]) 
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && @item.seller.id == current_user.id 
  end
end
