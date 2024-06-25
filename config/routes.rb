# config/routes.rb

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :bookings, only: [:index]
<<<<<<< HEAD

=======
    # member do
    #   patch 'validate', to: 'bookings#validate', as: :validate
    #   patch 'reject', to: 'bookings#reject', as: :reject
    # end
>>>>>>> 2d45d21de47de669dc3bee1fdb70f34e98110203
  resources :cars do
    resources :bookings, except: [:index]
  end

  get 'my_cars', to: 'cars#my_cars'
  get 'dashboard', to: 'pages#dashboard'
end
