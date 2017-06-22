Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :emails, only: [:create, :new]

  resources :authors

  resources :posts do
    resources :comments
  end

  root 'posts#index'

end
