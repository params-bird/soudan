class ChatRoom < ApplicationRecord
  include IdGenerator
  has_many :users, through: :user_chat_room
  has_many :user_chat_rooms
  belongs_to :topic
  has_many :messages
end
