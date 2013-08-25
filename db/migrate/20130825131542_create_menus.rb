class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :date_init

      t.timestamps
    end
  end
end
