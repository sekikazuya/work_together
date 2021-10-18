class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, :company, :occupation, :position
  end
  has_many :companies, dependent: :destroy
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :iquiries, dependent: :destroy
end
