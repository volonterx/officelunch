# -*- encoding : utf-8 -*-
class DashboardController < ApplicationController

  prepend_before_filter

  def index
    @date = DateTime.now
    @today_menu = Menu.today
    @order = current_user.today_order || current_user.orders.build
    @courses = @today_menu.try(:courses)
  end

end
