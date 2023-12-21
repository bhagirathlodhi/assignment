Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # @request.env["devise.mapping"] = Devise.mappings[:user]

  devise_for :users
  
  # devise_for :users, controllers: {
  #   registrations: 'registrations'
  # }
  namespace :admin do
    resources :users do
      member do
        put 'block'
        put 'unblock'
      end
    end
  end


  root "categories#index"
  resources :categories do
    resources :products 
  end

  resources :bookings, only: [:show, :create]
  get "/my_bookings", to: "bookings#my_bookings"
  post "/payment_completed", to: "bookings#payment_completed"
end
