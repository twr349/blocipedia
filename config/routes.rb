Rails.application.routes.draw do

  resources :charges, only: [:new, :create]

  resources :wikis 
  
  resources :collaborators
  
  resources :wikis do
      resources :collaborators
   end

  resources :downgrades

  devise_for :users
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
