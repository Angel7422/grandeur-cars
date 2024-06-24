# config/routes.rb

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :bookings, only: [:index]

  resources :cars do
    resources :bookings, except: [:index]
  end

  get 'my_cars', to: 'cars#my_cars'
  get 'dashboard', to: 'pages#dashboard'
end
