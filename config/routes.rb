Mycity::Application.routes.draw do
  devise_for :users
  resources :issues

  namespace :api do
    resources :users
    resources :issues do
      resources :votes
    end
  end

  resources :home
  root :to => "home#index"
end
