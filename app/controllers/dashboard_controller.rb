# -*- encoding : utf-8 -*-
class DashboardController < ApplicationController
  def index
    @date = DateTime.now
    @today_menu = Menu.today
  end
end
