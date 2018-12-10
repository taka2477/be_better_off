Rails.application.routes.draw do
  devise_for :users, :controllers => {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  resources :users

  root 'pages#index'
  get  'pages/show'
end
