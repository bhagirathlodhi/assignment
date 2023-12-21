Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # @request.env["devise.mapping"] = Devise.mappings[:user]
  devise_for :users
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
 
  devise_scope :user do
    get "/some/route" => "some_devise_controller"
  end
  

  namespace :users do
    resources :registrations, only: [:index]
  end

  namespace :users do
    devise_for :users, controllers: { registrations: 'users/registrations' }
  end
  
  


  root "categories#index"
  resources :categories do
    resources :products 
  end

  resources :bookings, only: [:show, :create]
  get "/my_bookings", to: "bookings#my_bookings"
  post "/payment_completed", to: "bookings#payment_completed"
end
