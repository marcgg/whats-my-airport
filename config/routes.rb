AirportCodes::Application.routes.draw do
  root :to => "users#new"
  match "/:name/:id" => "users#show", :as => :result
  resources :users, :only => [:create]
end
