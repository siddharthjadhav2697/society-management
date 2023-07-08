class CreateSocieties < ActiveRecord::Migration[6.0]
  def change
    create_table :societies do |t|
      t.string :name
      t.string :society_id
      t.string :society_type
      t.string :address
      t.bigint :buildings_count
      t.boolean :security_available
      t.boolean :parking_available

      t.timestamps
    end
  end
end
