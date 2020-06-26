Rails.application.routes.draw do
  devise_for :users
    root to: 'items#index'
    resources :items do
      member do
        get :confirm
      end
    end
    resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :cards do
      member do
        get :confirm
      end
    end
end