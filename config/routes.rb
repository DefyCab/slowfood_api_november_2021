Rails.application.routes.draw do
  get 'products/index'
  namespace :api do
    resources :orders, only: [:create, :update]
    resources :products, only: [:index]
  end

end
