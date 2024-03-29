Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :properties, only: %i[edit update show]
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard" => "dashboard#show"
  root "site#index"
end
