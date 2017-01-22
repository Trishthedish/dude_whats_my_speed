Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :services
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #
  # get 'broadband/show/' => "#"
  get 'rasberry_pis/index' => 'rasberry_pi#index'
  post 'rasberry_pis/index' => 'rasberry_pi#create'

# https://robots.thoughtbot.com/back-to-basics-http-requests
  # match '/curl_example' => 'request_example#curl_post_example', via: :post

  get 'users/index' => 'users#index'

  get 'welcome/about' => 'welcome#about'

  get 'welcome/contact' => 'welcome#contact'
  # get "service#index"

  # locations search?

  get 'services/show' => 'services#show'
  resources :locations

  stormpath_rails_routes

end


# services GET    /services(.:format)           services#index
#               POST   /services(.:format)           services#create
#   new_service GET    /services/new(.:format)       services#new
#  edit_service GET    /services/:id/edit(.:format)  services#edit
#       service GET    /services/:id(.:format)       services#show
#               PATCH  /services/:id(.:format)       services#update
#               PUT    /services/:id(.:format)       services#update
#               DELETE /services/:id(.:format)       services#destroy
#          root GET    /                             welcome#index
#     locations GET    /locations(.:format)          locations#index
#               POST   /locations(.:format)          locations#create
#  new_location GET    /locations/new(.:format)      locations#new
# edit_location GET    /locations/:id/edit(.:format) locations#edit
#      location GET    /locations/:id(.:format)      locations#show
#               PATCH  /locations/:id(.:format)      locations#update
#               PUT    /locations/:id(.:format)      locations#update
#               DELETE /locations/:id(.:format)      locations#destroy
