Mycity::Application.routes.draw do
  resources :home
  root :to => "home#index"

  namespace :api do
    resources :issues
  end
end
