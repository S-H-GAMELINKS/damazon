Rails.application.routes.draw do
  namespace :admin do
      resources :admin_users
      resources :users
      resources :carts
      resources :cart_items
      resources :categories
      resources :products
      resources :reviews

      root to: "admin_users#index"
    end
  root 'web#index'
  get '/about', to: 'web#about'
  get '/contact', to: 'web#contact'
  get '/users/mypage', to: 'user#mypage'
  get '/users/mypage/edit', to: 'user#edit'
  patch '/users/mypage', to: 'user#update'
  devise_for :admin_users
  devise_for :users
  resources :cart_items, only: [:update, :destroy]
  resources :carts, only: [:index, :create, :edit, :update, :destroy]
  resources :products do
    member do
      post :like
    end
    collection do
      post :import_csv
      get :export_csv
    end
    resources :reviews, only: [:create, :update, :destroy]
  end
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
