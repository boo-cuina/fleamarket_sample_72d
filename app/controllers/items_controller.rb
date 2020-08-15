class ItemsController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:show, :edit, :destroy, :update, :confirm, :purchase]
  before_action :move_to_index, only: [:edit, :destroy, :update]
  before_action :set_category, only: [:new, :edit]
  
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
    @category = Category.find_by(id: @item.category_id)
    if @category.nil?
      @item.valid?
      @item.photos.build
      render :new
      return false
    end
    if @category.is_childless? && @item.valid?
      @item.save
      redirect_to controller: :items, action: :index
    else
      @item.valid?
      @item.errors.add(:category_id, "can't be blank")
      @item.photos.build
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
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      @item.valid?
      render :edit
    end
  end

  def confirm
    #商品/ユーザー/クレジットカードの変数設定
    @user = current_user
    @first_photo = @item.photos[0]
    @card = Card.where(user_id: current_user.id).first
    @address = Address.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to controller: "cards", action: "new"
    else
      #Payjpの秘密鍵を取得
      Payjp.api_key =  ENV["PAYJP_PRIVATE_KEY"]
      #Payjpから顧客情報を取得し、表示
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #カスタマー情報からカードの情報を引き出す
      @default_card_information = customer.cards.retrieve(customer.default_card)

      #カードのアイコン表示のための定義づけ
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "logo_download_ph001.png"
      when "JCB"
        @card_src = "jcb-logomark-img-03.gif"
      when "MasterCard"
        @card_src = "logo_download_ph002.png"
      when "American Express"
        @card_src = "amex-logomark-img-06.gif"
      when "Diners Club"
        @card_src = "logo_download_ph003.png"
      when "Discover"
        @card_src = "discover-logomark-img-06.gif"
      end
      # viewの記述を簡略化
      @last4 = @default_card_information.last4
      ## 有効期限'月'を定義
      @exp_month = @default_card_information.exp_month.to_s.rjust(2, '0')
      ## 有効期限'年'を定義
      @exp_year = @default_card_information.exp_year.to_s.slice(2, 2)
    end
  end

  def purchase
    @card = Card.where(user_id: current_user.id).first
    #Payjpの秘密鍵を取得と決済処理
    Payjp.api_key =  ENV["PAYJP_PRIVATE_KEY"]
    charge = Payjp::Charge.create(
      amount: @item.price, #支払金額を入力
      customer: Payjp::Customer.retrieve(@card.customer_id), #顧客ID
      currency: 'jpy'  #日本円
    )
    #製品のbuyer_idを付与
    @item_buyer = Item.find(params[:id])
    @item_buyer.update(buyer_id: current_user.id)
    redirect_to done_item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :size, :status, :price, 
      :shipping_fee, :shippingfrom_id, :shipping_days, :category_id,
      photos_attributes:[:_destroy,:image,:id,]).merge(seller_id: current_user.id)

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
