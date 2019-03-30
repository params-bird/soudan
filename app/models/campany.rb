class Campany < ApplicationRecord

  has_many :likes
  has_many :funs
  has_many :masseges
  has_many :offers
end
