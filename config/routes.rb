Rails.application.routes.draw do

  resources :wikis

  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
