Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  get  'home/policy'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users,
    controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      passwords: 'users/passwords'
      #controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  }

  resources :users, only: [:index, :show]
end
