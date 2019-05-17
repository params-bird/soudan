Rails.application.routes.draw do

  resources :soudan, only: [:index, :kiyaku, :privacy_policy]
  root 'soudan#index'

  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
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
    resources :user_chat_rooms, only: [:index], as: 'chat_rooms'
    resources :messages, only: [:create, :destroy]
    resources :messages do
      resources :thanks, only: [:create, :destroy]
      resources :bads, only: [:create, :destroy]
    end
  end

  resources :users, path: '/', only: [:user_topics]


  resources :topics do
    resource :closes, only: [:create]
    resources :chat_rooms
  end

  get 'test', to: 'soudan#test', as: 'test'
  get 'user/index', to: 'users#index', as: 'user_index'
  get 'user/:id', to: 'users#mypage', as: 'user_mypage'
  get 'users/:id/topics', to: 'users#user_topics', as: 'user_topics'
  get 'search', to: 'topics#search', as: 'topics_search'
  get 'kiyaku', to: 'soudan#kiyaku', as: 'kiyaku'
  get 'privacy_policy', to: 'soudan#privacy_policy', as: 'privacy_policy'
  get 'contact', to: 'soudan#contact', as: 'contact'
  get 'google24691b576cdb2e10.html', to: 'google24691b576cdb2e10.html'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end