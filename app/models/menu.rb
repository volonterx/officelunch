# -*- encoding : utf-8 -*-
class Menu < ActiveRecord::Base
  has_and_belongs_to_many  :courses

  validate :date_init, presence: true

  before :destroy { courses.clear }

end
# == Schema Information
#
# Table name: menus
#
#  id         :integer         not null, primary key
#  date_init  :date
#  created_at :datetime
#  updated_at :datetime
#

