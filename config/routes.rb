Rails.application.routes.draw do
  resources :services
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  # get 'broadband/show/'

  # get "service#index"

  # locations search?
  resources :locations 


end
