class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :category　
  has_many :products, dependent: :destroy
  has_many :liles
  has_many :funs
  has_many :masseges






end
