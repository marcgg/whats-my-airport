AirportCodes::Application.routes.draw do
  root :to => "users#new"
  match "/:name/:id" => "users#show", :as => :result
  match "/admin" => "admin#index", :as => :admin
  match "/logout" => "admin#logout", :as => :logout

  resources :users, :only => [:create, :index]

  match '*path', :controller => 'application', :action => 'not_found'
end
