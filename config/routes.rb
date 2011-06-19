Mycity::Application.routes.draw do  resources :issues
  devise_for :users

  namespace :api do
    resources :users
    resources :issues do
      resources :votes
    end
  end

  resources :home
  root :to => "home#index"
end
