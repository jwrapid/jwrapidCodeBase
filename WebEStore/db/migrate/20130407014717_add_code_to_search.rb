class AddCodeToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :code, :string
  end
end
