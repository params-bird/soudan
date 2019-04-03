class Campany < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :user

  validates :campany_url, presence: true, format: { with: /\A#{URI::regexp(%w(http https))}\z/, message: '入力に誤りがあります。' }

  validates :tel, presence: true, format: { with: /\A[0-9]+\z/, message: 'ハイフンを除いて入力してください' }

  validates :staff_last_name_kana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/, message: '全角カタカナで入力して下さい。' }
  validates :staff_first_name_kana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/, message: '全角カタカナで入力して下さい。' }

end