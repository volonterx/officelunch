# -*- encoding : utf-8 -*-
class Order < ActiveRecord::Base
  has_and_belongs_to_many :courses, :join_table => 'order_courses'
  belongs_to :user

  scope :today, -> {where('orders.date_order = ?', Date.today)}

  accepts_nested_attributes_for :courses


  def self.all_user_ordered_dinner?
    today.count == User.count
  end

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

