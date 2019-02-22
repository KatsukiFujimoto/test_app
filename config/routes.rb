Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end
  root 'pages#home'
  resources :users, only: :show
  resources :likes, only: [:create, :destroy]

  resources :posts do
    resources :comments, only: [:show, :new, :create, :destroy]
  end

  resources :comments do
    resources :comments, only: [:show, :new, :create, :destroy]
  end
end
