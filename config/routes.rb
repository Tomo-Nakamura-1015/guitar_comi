Rails.application.routes.draw do
  
  root 'home#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :items do
    resources :comments, only: [:create, :destroy]
  end
end