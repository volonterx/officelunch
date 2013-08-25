# -*- encoding : utf-8 -*-
class DashboardController < ApplicationController

  prepend_before_filter

  def index
    @date = DateTime.now
    @today_menu = Menu.today
  end
end
