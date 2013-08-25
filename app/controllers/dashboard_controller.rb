# -*- encoding : utf-8 -*-
class DashboardController < ApplicationController
  def index
    @date = DateTime.now
  end
end
