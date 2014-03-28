class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :image
      t.decimal :price, precision: 8, scale: 2
      t.text :description
      t.decimal :weight, precision: 8, scale: 2
      t.string :dimension

      t.timestamps
    end
  end
end
