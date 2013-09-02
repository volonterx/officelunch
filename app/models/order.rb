# -*- encoding : utf-8 -*-
class Order < ActiveRecord::Base
  has_and_belongs_to_many :courses, :join_table => 'order_courses'
  belongs_to :user

  accepts_nested_attributes_for :courses

end
# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  date_order :date
#  user_id    :integer
#  sum        :float
#  created_at :datetime
#  updated_at :datetime
#

