# -*- encoding : utf-8 -*-
class CourseCategory < ActiveRecord::Base
  has_many :courses, dependent: :destroy

  validates :name, presence: true
end
# == Schema Information
#
# Table name: course_categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

