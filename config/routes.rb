Ringsail::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  
  root :to => "outlets#verify"

  # API call /outlets/add, both GET and POST
  match "outlets/add" => "outlets#add", :via => :get, :as => :add
  match "outlets/add" => "outlets#update", :via => :post, :as => :update
  
  # API call /outlets/remove, either DELETE or POST
  match "outlets/remove" => "outlets#remove", :via => :post, :as => :remove
  match "outlets/:service/:account" => "outlets#destroy", :via => :delete, :as => :destroy

  # API call /outlets/verify, GET
  # and synonym /outlets/{service}/{account}, GET
  match "outlets/verify" => "outlets#verify", :via => :get, :as => :verify
  match "outlets/:service/:account" => "outlets#show", :via => :get, :as => :show
  
  # API call /auth_tokens/request, GET and POST
  match "auth_tokens/request" => "auth_tokens#new", :via => :get, :as => :new
  match "auth_tokens/request" => "auth_tokens#create", :via => :post, :as => :create

  # API call /agencies, GET
  match "agencies" => "agencies#list", :via => :get

  # API call /tags, GET
  match "tags" => "official_tags#list", :via => :get
  
  # API call /locations/resolve, GET
  match "locations/resolve" => "outlet_locations#resolve", :via => :get
end
