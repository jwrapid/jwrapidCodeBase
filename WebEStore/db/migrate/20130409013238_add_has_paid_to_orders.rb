class AddHasPaidToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :has_paid, :boolean, default: false
  end
end
