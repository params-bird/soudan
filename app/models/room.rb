class Room < ApplicationRecord
  has_many :messages
  has_many :entries
  # belongs_to :user, through: :entry
end
