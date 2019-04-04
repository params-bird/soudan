class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  # userモデルの中でcampanyモデルへも同時書き込み　ーーーーーーーーー
  has_one :campany, inverse_of: :user
  accepts_nested_attributes_for :campany

# ユーザーがユーザーをフォローするための設定　ーーーーーーーーーーーーー
  has_many :active_funs, class_name: "Fun",
  foreign_key: "follower_id",
  dependent: :destroy
  has_many :passive_funs, class_name: "Fun",
  foreign_key: "follower_id",
  dependent: :destroy

   # ユーザーをフォローする
   def follow(other_user)
    active_funs.create(followed_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_funs.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

# いいねメソッド定義　ーーーーーーーーーーーーーー
  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end


end
