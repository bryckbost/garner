Garner::Application.routes.draw do
  resources :plants
  root :to => "plants#index"
end
