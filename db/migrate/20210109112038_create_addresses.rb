class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,       null: false
      t.integer :area_id,          null: false
      t.string :municipalities,    null: false
      t.string :number,            null: false
      t.string :building,          null: false
      t.string :tel,               null: false
      t.references :buy,           foreign_key: true
      t.timestamps
    end
  end
end
