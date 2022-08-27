Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kayaks

  get 'home', to: 'pages#index'
  post 'create', to: 'pages#create'

  get '/my_bookings', to: 'dashboards#my_bookings'
  get '/booking_received', to: 'dashboard#bookings_received'

end
