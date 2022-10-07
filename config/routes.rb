Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get "/public_recipes", to: "recipes#public_recipes"
  get '/shopping_list', to: 'shopping_list#index', as: 'shopping_list'
  resources :users do
  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods, only: %i[create destroy]
  end
  end
  resources :foods, only: %i[index show new create destroy] do
  resources :recipe_foods, only: %i[create destroy]
  end
end