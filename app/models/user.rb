class User < ApplicationRecord
  include IdGenerator

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

  mount_uploader :avater, ImageUploader


  def self.create_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        name: auth.displayName,
        avater: auth.pictureUrl,
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
      )
    end
    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
