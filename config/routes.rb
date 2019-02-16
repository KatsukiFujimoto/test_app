Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end
  root 'pages#home'
end
