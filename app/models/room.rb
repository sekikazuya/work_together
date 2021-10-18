class Room < ApplicationRecord
  belongs_to :company
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :iquiries, dependent: :destroy

  validates :title, presence: true
end
