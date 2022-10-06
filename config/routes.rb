Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get "/public_recipes", to: "recipes#public_recipes"
  resources :users do
  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods, only: %i[create destroy]
  end
  resources :foods, only: %i[index show new create destroy] do
    resources :recipe_foods, only: %i[create destroy]
    end
  end
end