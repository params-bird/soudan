Rails.application.routes.draw do

  root 'soudan#soudan_top'

  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
  }

  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end



  resources :users do
    resources :bads, only: [:create, :destroy]
    resources :thanks, only: [:create, :destroy]
    resources :blocks, only: [:create, :destroy]
  end

  resources :topics do
    resource :closes, only: [:create]
    resources :chat_rooms, only: [:new, :create, :show, :destroy]
  end


  resources :chat_rooms
  get 'chat_room', to: 'chat_rooms#room'
  resources :user_chat_rooms

  resources :soudan, only: [:index]
  resources :messages, only: [:create]
  get 'soudan_top', to: 'users#soudan_top'



  
end