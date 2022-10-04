Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  get "/public_recipes", to: "recipes#public_recipes"
    resources :users, only: [:index, :show]  do
      resources :recipes, only: [:index, :show, :new, :create, :destroy]
    end
end
