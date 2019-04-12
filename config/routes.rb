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
    get 'parts' =>  'users/registrations#parts'
  end

  resources :users do
    member do
      get :following, :followers
      get 'user_products', to: 'users#user_products_index', as: 'products'
    end
  end

resources :users, only: [:show] do
  resources :rooms, only: [:show, :index]
    member do
      get 'show'
      get 'index'
    end
end


  resources :products do
    resources :likes, only: [:create, :destroy]
  end

  resources :rooms, only: [:create, :index]
  resources :funs, only: [:create, :destroy]
  resources :messages, only: [:create]

end