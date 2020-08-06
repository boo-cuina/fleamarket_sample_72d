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
    #Ajaxで動くアクションのルートを作成
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
      member do
        get :confirm
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
    end
    resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :cards, only: [:new, :show, :create, :delete] do
      member do
        get 'show', to: 'cards#show'
        post 'pay', to: 'card#pay'
        get 'delete', to: 'cards#delete'
        get 'confirm'
      end
    end
    # resources :purchase, only: [:index] do
    #   member do
    #     post 'index'
    #     get 'pay'
    #   end
    # end
    get 'sessions/destroy'
end