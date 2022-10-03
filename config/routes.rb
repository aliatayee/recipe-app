Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:index, :show]  do
    resources :recipes, only: [:index, :show, :new, :create, :destroy] end
  end
end
