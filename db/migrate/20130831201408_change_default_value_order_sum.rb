class ChangeDefaultValueOrderSum < ActiveRecord::Migration
  def up
    change_column :orders, :sum, :float, default: 0
  end

  def up
    change_column :orders, :sum, :float
  end
end
