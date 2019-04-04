Rails.application.routes.draw do

  root 'users#index'

  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
  }

  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
    get '/campany/sign_up' => 'users/registrations#campany' ,as: :new_campany
    post'/campany' => 'users/registrations#create'
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :products do
    resources :likes, only: [:create, :destroy]
  end

  resources :funs, only: [:create, :destroy]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]

end
