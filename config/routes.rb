Rails.application.routes.draw do
  
  resources :charges, only: [:new, :create]

  devise_for :users
  
  resources :wikis

  get 'welcome/index'

  get 'welcome/about'
  
  get 'charges/cancel', :as => :cancel_charge
  
  post 'charges/downgrade', :as => :downgrade_charge
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
