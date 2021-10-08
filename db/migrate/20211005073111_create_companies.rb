class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string     :name,          null: false
      t.string     :name_kana,     null: false
      t.integer    :sector_id,     null: false
      t.integer    :industry_id,   null: false
      t.text       :profile,       null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :building_name
      t.string     :phone,         null: false
      t.text       :business_hours
      t.references :user,          null:false, foreign_key: true
      t.timestamps
    end
  end
end
