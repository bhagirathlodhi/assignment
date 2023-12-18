Rails.application.routes.draw do

  devise_for :users

  
  root "categories#index"
  resources :categories do
    resources :products 
  end

  resources :bookings, only: [:my_bookings, :show, :create]
end
