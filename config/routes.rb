# == Route Map
#
# Prefix Verb   URI Pattern          Controller#Action
#   root GET    /                    welcome#index
#  tasks GET    /tasks(.:format)     tasks#index
#        POST   /tasks(.:format)     tasks#create
#   task GET    /tasks/:id(.:format) tasks#show
#        PATCH  /tasks/:id(.:format) tasks#update
#        PUT    /tasks/:id(.:format) tasks#update
#        DELETE /tasks/:id(.:format) tasks#destroy
# 

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :tasks
end
