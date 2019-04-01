Rails.application.routes.draw do

  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
  }

  devise_for :campanies, controllers: {
    confirmations: 'ampanies/confirmations',
    passwords:     'campanies/passwords',
    registrations: 'campanies/registrations',
    sessions:      'campanies/sessions',
  }

  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end

  devise_scope :campany do
    get '/campanies/sign_out' => 'campanies/sessions#destroy'
  end


  root 'users#show'
  resources :products
  # resources :campanies
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
