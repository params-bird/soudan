class User < ApplicationRecord
  include IdGenerator

  mount_uploader :avater, ImageUploader

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


  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.create(
        name:     auth.info.name,
        email: auth.info.email,
        provider: auth.provider,
        uid:      auth.uid,
        avater:   auth.info.image,
        token:    auth.credentials.token,
        password: Devise.friendly_token[0, 20],
      )
    end
    user
  end
end