Rails.application.routes.draw do
  resources :products
  resources :searches
  resources :evenements
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
