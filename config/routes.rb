Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  get  'home/policy'

  resources :posts

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
    #omniauth_callbacks: 'users/omniauth_callbacks',
  }

  resources :users, only: [:index, :show]
end
