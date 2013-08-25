# -*- encoding : utf-8 -*-
class CreateOrderCourses < ActiveRecord::Migration
  def change
    create_table :order_courses do |t|
      t.integer :course_id
      t.integer :order_id
      t.boolean :half

      t.timestamps
    end
  end
end
