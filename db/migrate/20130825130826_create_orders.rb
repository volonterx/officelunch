# -*- encoding : utf-8 -*-
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date_order
      t.integer :user_id
      t.float :sum

      t.timestamps
    end
  end
end
