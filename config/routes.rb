Rails.application.routes.draw do
  root "activities#index"

  resources :activities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
