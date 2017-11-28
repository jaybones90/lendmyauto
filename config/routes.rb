Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :users do
    resources :vehicles
  end

  resources :addresses

  resources :reservations

  resources :vehicles do
    resources :features
    resources :images
  end
end
