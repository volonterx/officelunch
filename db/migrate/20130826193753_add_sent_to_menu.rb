# -*- encoding : utf-8 -*-
class AddSentToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :sent, :boolean, default: false
  end
end
