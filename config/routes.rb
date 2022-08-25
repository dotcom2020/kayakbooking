Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kayaks

  get '/my_bookings', to: 'dashboards#my_bookings'
  get '/booking_received', to: 'dashboard#bookings_received'

end
