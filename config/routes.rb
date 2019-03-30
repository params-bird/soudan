Rails.application.routes.draw do
  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'users#show'
  resources :products

  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
