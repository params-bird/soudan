class Topic < ApplicationRecord
  include IdGenerator
  belongs_to :category
  belongs_to :user
  has_many :chat_rooms
  has_one :close
end
