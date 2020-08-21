class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,             null: false
      t.text :discription,        null: false
      t.integer :categpry,        null: false
      t.integer :status,          null: false
      t.integer :delivery_chaege, null: false
      t.integer :shipping_area,   null: false
      t.integer :shipping_day,    null: false
      t.integer :price,           null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
