class Company < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  with_options presence: true do
    validates :name,
              :name_kana,
              :sector_id,
              :industry_id,
              :profile,
              :prefecture_id,
              :city,
              :phone,
  end
end
