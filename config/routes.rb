Rails.application.routes.draw do
  root "activities#index"

  get "/activities", to: "activities#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
