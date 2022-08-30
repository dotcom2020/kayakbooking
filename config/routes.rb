Rails.application.routes.draw do
  devise_for :users
  
  root to: "kayaks#index"

  resources :kayaks do
    resources :bookings only: %i(new create edit update destroy)
  end

  get "/dashboard", to: "pages#dashboard"
end
