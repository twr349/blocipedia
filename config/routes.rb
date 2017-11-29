Rails.application.routes.draw do

  resources :charges, only: [:new, :create]

  resources :wikis

  resources :downgrades

  devise_for :users
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
