# -*- encoding : utf-8 -*-
class OrderCourse < ActiveRecord::Base
end
# == Schema Information
#
# Table name: order_courses
#
#  id         :integer         not null, primary key
#  course_id  :integer
#  order_id   :integer
#  half       :boolean
#  created_at :datetime
#  updated_at :datetime
#

