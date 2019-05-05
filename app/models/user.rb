class User < ApplicationRecord
  include IdGenerator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy

  has_many :topics, dependent: :destroy
  has_many :chat_rooms, through: :user_chat_rooms
  has_many :user_chat_rooms, dependent: :destroy
  has_many :thanks
  has_many :bads

  mount_uploader :avater, ImageUploader



# いいねメソッド定義　ーーーーーーーーーーーーーー
  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end


end
