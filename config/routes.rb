Rails.application.routes.draw do
  root "welcome#index"

  # registration & login in routes
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create", as: "log_in"
  delete "logout", to: "sessions#destroy"

  #passwords edit/reset
  get "password", to: "passwords#edit", as: "edit_password"
  patch "password", to: "passwords#update"

  resources :activities do
    resources :comments
  end
end
