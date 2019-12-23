Rails.application.routes.draw do
  get '/users/mypage', to: 'user#mypage'
  get '/users/mypage/edit', to: 'user#edit'
  devise_for :admin_users
  devise_for :users
  resources :products do
    member do
      post :like
    end
    resources :reviews, only: [:create, :update, :destroy]
  end
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
