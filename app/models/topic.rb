class Topic < ApplicationRecord
  include IdGenerator
  is_impressionable counter_cache: true
  belongs_to :category
  belongs_to :user
  has_many :chat_rooms
  has_one :close
end
