Rails.application.routes.draw do
  resource :webhook, only: [:create]

  resources :departures, only: [:index]
end
