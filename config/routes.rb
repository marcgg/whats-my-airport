AirportCodes::Application.routes.draw do
  root :to => "users#new"
  match "/admin" => "admin#index", :as => :admin
  match "/logout" => "admin#logout", :as => :logout
  match "/login" => "admin#login", :as => :login

  resources :users, :only => [:create, :index]
  resources :airports

  match "/:name/:id" => "users#show", :as => :result

  match '*path', :controller => 'application', :action => 'not_found'
end
