class Message < ApplicationRecord
  include IdGenerator
  belongs_to :chat_room
  belongs_to :user
  validates :content, presence: true
  has_one :thank
  has_one :bad
end
