Mycity::Application.routes.draw do
  devise_for :users

  resources :issues
  resources :home
  root :to => "home#index"

  namespace :api do
    resources :issues do
      resources :votes
    end
  end
end
