class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy
  mount_uploader :avater, ImageUploader

  # userモデルの中でcampanyモデルへも同時書き込み　ーーーーーーーーー
  has_one :campany, inverse_of: :user
  accepts_nested_attributes_for :campany

# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

# いいねメソッド定義　ーーーーーーーーーーーーーー
  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end


end
