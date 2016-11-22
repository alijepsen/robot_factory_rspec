# == Route Map
#
#              Prefix Verb   URI Pattern                                       Controller#Action
#                root GET    /                                                 static_pages#home
#               about GET    /about(.:format)                                  static_pages#about
#             contact GET    /contact(.:format)                                static_pages#contact
#     inventor_robots GET    /inventors/:inventor_id/robots(.:format)          robots#index
#                     POST   /inventors/:inventor_id/robots(.:format)          robots#create
#  new_inventor_robot GET    /inventors/:inventor_id/robots/new(.:format)      robots#new
# edit_inventor_robot GET    /inventors/:inventor_id/robots/:id/edit(.:format) robots#edit
#      inventor_robot GET    /inventors/:inventor_id/robots/:id(.:format)      robots#show
#                     PATCH  /inventors/:inventor_id/robots/:id(.:format)      robots#update
#                     PUT    /inventors/:inventor_id/robots/:id(.:format)      robots#update
#                     DELETE /inventors/:inventor_id/robots/:id(.:format)      robots#destroy
#           inventors GET    /inventors(.:format)                              inventors#index
#                     POST   /inventors(.:format)                              inventors#create
#        new_inventor GET    /inventors/new(.:format)                          inventors#new
#       edit_inventor GET    /inventors/:id/edit(.:format)                     inventors#edit
#            inventor GET    /inventors/:id(.:format)                          inventors#show
#                     PATCH  /inventors/:id(.:format)                          inventors#update
#                     PUT    /inventors/:id(.:format)                          inventors#update
#                     DELETE /inventors/:id(.:format)                          inventors#destroy
#         robot_parts GET    /robots/:robot_id/parts(.:format)                 parts#index
#                     POST   /robots/:robot_id/parts(.:format)                 parts#create
#      new_robot_part GET    /robots/:robot_id/parts/new(.:format)             parts#new
#     edit_robot_part GET    /robots/:robot_id/parts/:id/edit(.:format)        parts#edit
#          robot_part GET    /robots/:robot_id/parts/:id(.:format)             parts#show
#                     PATCH  /robots/:robot_id/parts/:id(.:format)             parts#update
#                     PUT    /robots/:robot_id/parts/:id(.:format)             parts#update
#                     DELETE /robots/:robot_id/parts/:id(.:format)             parts#destroy
#              robots GET    /robots(.:format)                                 robots#index
#                     POST   /robots(.:format)                                 robots#create
#           new_robot GET    /robots/new(.:format)                             robots#new
#          edit_robot GET    /robots/:id/edit(.:format)                        robots#edit
#               robot GET    /robots/:id(.:format)                             robots#show
#                     PATCH  /robots/:id(.:format)                             robots#update
#                     PUT    /robots/:id(.:format)                             robots#update
#                     DELETE /robots/:id(.:format)                             robots#destroy
#

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :inventors do
    resources :robots, except: [:index]
  end

  resources :robots do
    resources :parts, except: [:show]
  end

end
