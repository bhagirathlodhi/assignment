Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # @request.env["devise.mapping"] = Devise.mappings[:user]

  devise_for :users
  
  


  root "categories#index"
  resources :categories do
    resources :products 
  end

  resources :bookings, only: [:show, :create]
  get "/my_bookings", to: "bookings#my_bookings"
  post "/payment_completed", to: "bookings#payment_completed"
end
