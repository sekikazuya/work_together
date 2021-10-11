class Room < ApplicationRecord
  belongs_to :company
  has_many :room_users
  has_many :users, through: :room_users

  validates :title, presence: true
end
