Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users


  
  root "categories#index"
  resources :categories do
    resources :products 
  end

  resources :bookings, only: [:my_bookings, :show, :create]
  post "/payment_completed", to: "bookings#payment_completed"
end
