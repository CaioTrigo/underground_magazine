Rails.application.routes.draw do
  resources :comments
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  devise_for :users
  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts

  get "profile/:id", to: "pages#profile"
end
