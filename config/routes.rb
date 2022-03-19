Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, shallow: true do
    resources :likes, only: %i[create destroy]#, only: :create,
    resources :comments, except: %i[index show] do
      resources :replies, except: %i[index new show]
    end
  end

  resources :chatrooms, only: [:show, :index, :create] do
    resources :messages, only: :create
  end

  get "profile", to: "pages#profile", as: :profile

  get "users/:id/following", to: "users#following", as: :users_following
  get "users/:id/followers", to: "users#followers", as: :users_followers

  get "send_tip/:value", to: "posts#send_tip", as: :tips

  resources :users, only: [:index, :edit, :show] do
    member do
      post :follow
      post :unfollow
    end
  end
end
