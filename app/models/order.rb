# -*- encoding : utf-8 -*-
class Order < ActiveRecord::Base
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

