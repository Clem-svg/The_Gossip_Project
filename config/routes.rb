Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome/(:first_name)', to: 'static_pages#welcome'
  get 'static_pages/gossip_details/(:id)', to: 'static_pages#gossip_details', as: "gossip_details"
  get 'static_pages/user_details/(:id)', to: 'static_pages#user_details'

  resources :gossips
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end