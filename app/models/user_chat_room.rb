class UserChatRoom < ApplicationRecord
  include IdGenerator
  belongs_to :user
  belongs_to :chat_room
end
