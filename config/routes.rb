Rails.application.routes.draw do
  root 'home#index'
  get  'home/show'

  devise_for :users, :controllers => {
    registrations: 'users/registrations'
    #omniauth_callbacks: 'users/omniauth_callbacks',
  }

  resources :users
end
