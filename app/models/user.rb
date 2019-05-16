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

  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']
    credentials = omniauth['credentials']
    info = omniauth['info']

    # self.token = credentials['token']
    # self.secret = credentials['secret']
    # self.credentials = credentials.to_json
    self.name = info.name
    self.avater = info.image

    # self.set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  # def set_values_by_raw_info(raw_info)
  #   self.raw_info = raw_info.to_json
  #   self.save!
  # end

end
