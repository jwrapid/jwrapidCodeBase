class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :full_name
      t.text :address
      t.string :city
      t.string :postal_code
      t.string :shipping_type
      t.string :credit_card
      t.string :expiration_date

      t.timestamps
    end
  end
end
