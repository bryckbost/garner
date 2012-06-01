Garner::Application.routes.draw do
  get "home" => "content#home"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :plants
  resources :users
  resources :sessions

  root :to => "content#home"
end
