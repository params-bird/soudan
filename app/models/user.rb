class User < ApplicationRecord
  include IdGenerator

  mount_uploader :image, ImageUploader

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i[line google_oauth2]

  has_many :messages
  has_many :topics
  has_many :chat_rooms
  has_many :user_chat_rooms
  has_many :thanks, dependent: :delete_all
  has_many :bads, dependent: :delete_all

end