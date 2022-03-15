Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, shallow: true do
    resources :comments, except: %i[index show] do
      resources :replies, except: %i[index new show]
    end
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  get "profile/:id", to: "pages#profile"
end
