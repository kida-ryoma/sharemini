Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:index,:new,:create] do
    member do
      post "create_favorite"
    end
  end
end
