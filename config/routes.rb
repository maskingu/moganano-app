Rails.application.routes.draw do
  devise_for :users
  
  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'
  
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
      get 'tag'
    end
  end
  resources :users, only: :show


end
