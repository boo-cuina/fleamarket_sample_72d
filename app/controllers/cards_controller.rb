class CardsController < ApplicationController

#   before_action :get_user_params, only: [:edit, :confirmation, :show]
#   before_action :get_payjp_info, only: [:new_create, :create, :delete, :show]

#   def edit
#   end

#   def create      # payjpとCardのデータベース作成を実施
#     if params['payjp-token'].blank?
#       redirect_to action: "edit", id: current_user.id
#     else
#       customer = Payjp::Customer.create(
#         card: params['payjp_token'],
#       )
#       @card = Cards.new(user: current_user.id, customer_id: customer.id, card_token: customer.default_card)
#       if @card.save
#         redirect_to action: "show"
#       else
#         redirect_to action: "edit", id: current_user.id
#       end
#     end
#   end

#   def delete      # payjpとCardのデータベースを削除
#     card = current_user.cards.first
#     if card.present?
#       customer = Payjp::Customer.retrieve(card.customer_id)
#       customer.delete
#       card.delete
#     end
#       redirect_to action: "confirmation", id: current_user.id
#   end

#   def show      # DBのCreditCard情報を、payjpに送りcustomer情報を取り出す為に実装
#     card = current_user.cards.first
#     if card.present?
#       customer = Payjp::Customer.retrieve(card.customer_id)
#       @default_card_information = customer.cards.retrieve(card.card_token)
#     else
#       redirect_to action: "confirmation", id: current_user.id
#     end
#   end

#   def confirmation
#     card = current_user.cards
#     redirect_to action: "show" if card.exists?
#   end

#   private

#   def get_payjp_info
#     if Rails.env == 'development'
#       Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
#     else
#       Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
#     end
#   end

# end



  require "payjp"

  def new
    card = Card.where(user: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay       #payjpとcardのデータベース作成
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
      )
      @card = Card.new(user: current_user.id, customer_id: customer.id, card_token: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def show        #cardのデータをpayjpに送り、情報を取り出す
    card = Card.where(user: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def delete      #payjpとcardデータベースを削除
    card = Card.where(user: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def confirm
  end

end