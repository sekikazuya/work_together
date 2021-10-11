class CreateIquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :iquiries do |t|
      t.text       :message
      t.references :user,    null: false, foreign_key: true
      t.references :room,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
