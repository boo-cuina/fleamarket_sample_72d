class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.includes(:photos).order('created_at DESC')

  end

  def new
    @item = Item.new
    @item.photos.new

    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
    # 以下全て、formatはjsonのみ
    # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children =  Category.find("#{params[:parent_name]}").children
  end

    # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
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
    @category = Category.find(params[:id])
    @parents = Category.all
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
  end

  def confirm
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :size, :status, :price, 
      :shipping_fee, :shippingfrom_id, :shipping_days, :category_id,
      photos_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id]) 
  end
end
