class Company < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sector
  belongs_to :industry
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
  has_many :rooms

  def self.search(search)
    if search != ""
      Company.where('profile LIKE(?)', "%#{search}%")
    else
      Company.all
    end
  end

  with_options presence: true do
    validates :name,
              :profile,
              :city
              :image
    validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :phone, format: { with: /\A\d{10,11}\z/ }
  end
  validates :sector_id, :industry_id, :prefecture_id, numericality: { other_than: 0, message: "プルダウンより選択してください" }
end
