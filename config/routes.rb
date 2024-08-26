Rails.application.routes.draw do
   get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  devise_for :users
  resources :games do
    resources :comments, only: [:create]
  end
  root 'games#index'
end
