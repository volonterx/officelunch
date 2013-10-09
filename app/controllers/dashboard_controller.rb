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
    new_order_service = CompletionOrderService.new
    @params = new_order_service.get_order_params
  end

  def closed_orders
    Order.today.update_all(closed: true)
    redirect_to dashboard_index_path, notice: I18n.t('front.dashboard.order_close')
  end

end
