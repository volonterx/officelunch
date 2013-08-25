# -*- encoding : utf-8 -*-
class Menu < ActiveRecord::Base
  has_and_belongs_to_many  :courses
  accepts_nested_attributes_for :courses, :reject_if => proc {|attrs| attrs['course_ids'].empty? }

  validates :date_init, presence: true
  validates :date_init, uniqueness: true
  validate :must_have_courses

  before_destroy { courses.clear }


  def self.today
    where(date_init: Date.today).first
  end

   def must_have_courses
    errors.add(:courses_errors, 'Выберите хотя бы одно блюдо') if courses_empty?
   end

   def courses_empty?
     courses.empty?
   end
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

