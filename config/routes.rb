Rails.application.routes.draw do
  devise_for :users
  resources :games do
    resources :comments, only: [:create]
  end
  root 'games#index'
end
