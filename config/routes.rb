Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :accounts do
    resources :drivers_licenses
    resources :images, only: [:new, :create]
  end

  resources :locations do
    resources :vehicles
  end



  resources :vehicles do
    resources :reservations
    resources :images
  end
end
