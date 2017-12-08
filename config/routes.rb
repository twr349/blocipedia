Rails.application.routes.draw do

  resources :charges, only: [:new, :create]

  
  
  resources :collaborators
  
  resources :wikis do
     resources :collaborators, only: [:new, :create, :update, :destroy]
   end

  resources :downgrades

  devise_for :users
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
