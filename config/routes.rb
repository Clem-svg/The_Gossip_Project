Rails.application.routes.draw do
  root 'gossips#index'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome/(:first_name)', to: 'static_pages#welcome'

  resources :gossips
  resources :users
  resources :cities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end