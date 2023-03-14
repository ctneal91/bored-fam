Rails.application.routes.draw do
  root "activities#index"

  resources :activities do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
