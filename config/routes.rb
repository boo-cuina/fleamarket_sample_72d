Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

    root to: 'items#index'
    resources :items do
      member do
        get :confirm
      end
    #Ajaxで動くアクションのルートを作成
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
    end
    resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :cards, only: [:new, :show, :create] do
      member do
        post 'show', to: 'card#show'
        post 'pay', to: 'card#pay'
        post 'delete', to: 'card#delete'
      end
    end
    get 'sessions/destroy'
end