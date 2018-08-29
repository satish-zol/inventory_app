Rails.application.routes.draw do
  resources :line_items
  resources :carts, only: [:show]
  devise_for :admins, path: 'admin', skip: :registrations
  namespace :admin do
  	resources :products
  	resources :accessories
  end
  get 'admin' => 'admin/products#index'
  get '/products' => 'products#index'
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
