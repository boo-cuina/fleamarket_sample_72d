# 購入機能controller
class PurchaseController < ApplicationController

  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(customer.default_card)
      # 表示文字数変更処理
      @last4 = @default_card_information.last4
      @exp_month = @default_card_information.exp_month.to_s.rjust(2, '0')
      @exp_year = @default_card_information.exp_year.to_s.slice(2, 2)

      item = Item.where(item_id: params[:id]).first
      @name = item.name
      @price = item.price
      @shipp = item.shipping_fee
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    # シンボルにする
    amount: @price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: Payjp::Customer.retrieve(@card.customer_id), #顧客ID
    currency: 'jpy'  #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

end