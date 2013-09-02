# -*- encoding : utf-8 -*-
class DashboardController < ApplicationController

  prepend_before_filter

  def index
    @date = DateTime.now
    @today_menu = Menu.today
    @order = current_user.today_order || current_user.orders.build
    @courses = @today_menu.try(:courses)
  end

  def completion_order
    @params = {user: {}}
    User.all.each do |u|
      if u.today_order
        order = u.today_order
        @params[:user][u.name] = order
      end
    end
    @params[:total_courses_sum] = Order.joins(:courses).joins(:courses).where('orders.date_order = ?', Date.today).group("courses.name").sum(:price)
    @params[:need_order] = Order.joins(:courses).joins(:courses).where('orders.date_order = ?', Date.today).group("courses.name").count
    @params[:total_sum] = Order.where(date_order: Date.today).sum(:sum)

  end

end
