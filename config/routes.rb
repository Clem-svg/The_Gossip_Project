Rails.application.routes.draw do
  root 'gossips#index'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome/(:first_name)', to: 'static_pages#welcome'

  resources :gossips do
    resources :comments
    resources :favorites
  end
  resources :users
  resources :cities
  resources :sessions, only:[:new, :create, :destroy]
end