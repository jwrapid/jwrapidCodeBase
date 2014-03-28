class RemoveCreditCardFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :credit_card
    remove_column :orders, :expiration_date
  end

  def down
    add_column :orders, :credit_card, :string
    add_column :orders, :expiration_date, :string
  end
end
