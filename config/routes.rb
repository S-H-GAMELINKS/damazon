Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users
  resources :products do
    resources :reviews, only: [:create, :update, :destroy]
  end
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
