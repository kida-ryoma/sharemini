Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:index,:create, :show] do
    resources :comments, only: :create 
    member do
      post "create_favorite"
    end
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      get :followings
      get :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :categories, only: :show
end
