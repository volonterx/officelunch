class CreateMenuCourses < ActiveRecord::Migration
  def change
    create_table :menu_courses do |t|
      t.integer :menu_id
      t.integer :course_id

      t.timestamps
    end
  end
end
