class CreateResidents < ActiveRecord::Migration[6.0]
  def change
    create_table :residents do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.bigint :age
      t.bigint :phone_number
      t.bigint :room_number
      t.bigint :floor_number
      t.references :society, null: false, foreign_key: true
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
