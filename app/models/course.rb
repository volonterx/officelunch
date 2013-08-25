class Course < ActiveRecord::Base
  belongs_to :category, class_name: "CourseCategory"
end
