# -*- encoding : utf-8 -*-
class CreateCourseCategories < ActiveRecord::Migration
  def change
    create_table :course_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
