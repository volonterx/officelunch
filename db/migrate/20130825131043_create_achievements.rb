# -*- encoding : utf-8 -*-
class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
