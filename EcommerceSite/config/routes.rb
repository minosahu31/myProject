Rails.application.routes.draw do

  devise_for :users
  root "products#index"

  resources :products
  resources :carts do
    resources :orders
  end

end
