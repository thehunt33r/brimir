Brimir::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }

  resources :users

  namespace :tickets do
    resource :deleted, only: :destroy, controller: :deleted
    resource :selected, only: :update, controller: :selected
  end

  resources :tickets, only: [:index, :show, :update, :new, :create]

  resources :labelings, only: [:destroy, :create]

  resources :rules

  resources :labels, only: [:destroy, :update, :index]

  resources :replies, only: [:create, :new]

  get '/attachments/:id/:format' => 'attachments#show'
  resources :attachments, only: [:index, :new]

  resources :email_addresses, only: [:index, :create, :new, :destroy]

  root to: 'tickets#index'

  namespace :api do
    namespace :v1 do
      resources :tickets, only: [ :index, :show ]
      resources :sessions, only: [ :create ]
    end
  end

end
