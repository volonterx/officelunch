class AddNotOrderToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :not_order, :boolean, default: false
  end
end
