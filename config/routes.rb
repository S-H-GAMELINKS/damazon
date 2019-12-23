Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/update'
  get 'reviews/destroy'
  devise_for :admin_users
  devise_for :users
  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
