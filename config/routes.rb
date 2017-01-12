Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# pages is the controller, include some initial actions.
# home & contact are actions.
  # get "pages/home"
  # get "pages/contact"
  # raoils looks in the Pages controller and executes the code in the home action.
  root to: 'welcome#index'

  resources :services
  resources :locations

  #                           welcome#search?
  #get "locations/search", to: "locations#search"
  # May not use end "search_locations path"
  get 'locations/search' => 'locations#search', as: "search_locations"

end
