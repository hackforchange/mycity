Mycity::Application.routes.draw do
  resources :home
  root :to => "home#index"

  resources :issues
end
