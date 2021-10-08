class Room < ApplicationRecord
  belomgs_to :company
  has_many :room_users
  has_many :users, through: :room_users
end
