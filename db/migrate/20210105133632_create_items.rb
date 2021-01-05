class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item,              null: false
      t.text    :explanation,       null: false
      t.integer :category_id,       null: false
      t.integer :quality_id,        null: false
      t.integer :price,             null: false
      t.integer :shipping_id,       null: false
      t.integer :area_id,           null: false
      t.integer :shipping_day_id,   null: false
      t.integer :user_id,           null: false
      t.timestamps
    end
  end
end