Mycity::Application.routes.draw do
  resources :home
  root :to => "home#index"

  namespace :api do
    resources :issues do
      resources :votes
    end
  end
end
