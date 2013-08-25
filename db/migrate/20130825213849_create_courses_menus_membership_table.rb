class CreateCoursesMenusMembershipTable < ActiveRecord::Migration
  def change
    create_table :courses_menus do |t|
      t.integer :course_id
      t.integer :menu_id
      t.timestamps
    end
  end
end
