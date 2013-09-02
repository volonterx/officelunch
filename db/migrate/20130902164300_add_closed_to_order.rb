class AddClosedToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :closed, :boolean, default: false
  end
end
