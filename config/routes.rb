Rails.application.routes.draw do
  root 'home#index'
  get  'home/show'

  resources :posts

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    #omniauth_callbacks: 'users/omniauth_callbacks',
  }

  resources :users, only: [:index, :show]
end
