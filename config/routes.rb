Rails.application.routes.draw do
  get 'signin/new'
  get 'signin/create'
  namespace :admin do
    root 'dashboard#index'
    resources :comics
    resources :categories
    resources :admin_users
    resources :signin, only: %i[new create destroy delete]
    resources :chapters, only: %i[create destroy]
    get 'dashboard/index'
  end

  devise_for :admin_users, controllers: { omniauth_callbacks: 'admin_users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
