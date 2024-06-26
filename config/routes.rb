Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :bookings
    # member do
    #   patch 'validate', to: 'bookings#validate', as: :validate
    #   patch 'reject', to: 'bookings#reject', as: :reject
    # end
  resources :cars do
    resources :bookings, except: [:index]
  end

  get 'my_cars', to: 'cars#my_cars'
  get 'dashboard', to: 'pages#dashboard'
end
