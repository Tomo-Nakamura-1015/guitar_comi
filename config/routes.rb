Rails.application.routes.draw do
  
  root 'home#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resource :account, :only => [:show, :edit] do
    resource :name, :only => [:edit, :update], module: "accounts"
    resource :email, :only => [:edit, :update], module: "accounts"
    resource :password, :only => [:edit, :update], module: "accounts"
    resource :image, :only => [:edit, :update], module: "accounts"
  end

  resources :items do
    resources :comments, only: [:create, :destroy]
  end

end