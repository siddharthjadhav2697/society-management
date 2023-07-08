class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :building_id
      t.bigint :floor_count
      t.bigint :room_count
      t.bigint :no_of_residents
      t.references :society, null: false, foreign_key: true

      t.timestamps
    end
  end
end
