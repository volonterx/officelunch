# -*- encoding : utf-8 -*-
class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :category_id
      t.integer :price

      t.timestamps
    end
  end
end
