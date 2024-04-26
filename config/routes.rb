Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :properties, only: %i[edit update show] do
    resources :availabilities, only: %i[index edit create]
  end
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard" => "dashboard#show"
  root "site#index"
end
