class Message < ApplicationRecord
  include IdGenerator

  belongs_to :chat_room
  belongs_to :user
  has_one :thank
  has_one :bad

  validates :content, presence: true

end
