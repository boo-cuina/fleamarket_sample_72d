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
        get 'items/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
        get 'items/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
      end
    end
    resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :cards do
      member do
        get :confirm
      end
    end
    get 'sessions/destroy'
end