# -*- encoding : utf-8 -*-
class Course < ActiveRecord::Base
  belongs_to :category, class_name: "CourseCategory"
  has_and_belongs_to_many  :menus
  has_and_belongs_to_many  :orders


  validates :name, :category_id, :price, presence: true

  before_destroy { menus.clear }

end
# == Schema Information
#
# Table name: courses
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  category_id :integer
#  price       :integer
#  created_at  :datetime
#  updated_at  :datetime
#

