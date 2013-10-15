# -*- encoding : utf-8 -*-
module DashboardHelper
  def check_for_active(controller, name)
    "active" if controller.controller_name == name
  end

  def params_for_order_form(order)
    if order.new_record?
      {method: :post, url: orders_path}
    else
      {method: :put, url: order_path(order)}
    end
  end

  def courses_include_to_order(order, c)
    order.courses.include?(c)
  end

  def number_users_to_order_lunch
    Order.where(date_order: Date.today).count
  end

  def dashboard_order_header(order, controller)
    if order.closed && order.not_order
      t("front.dashboard.you_not_order")
    else
      t("front.dashboard.#{@order.closed ? 'you_order' : 'dinner_menu'}")
    end
  end
  
  def today_orders_already_closed
    Order.today.try(:first).try(:closed)
  end
end
