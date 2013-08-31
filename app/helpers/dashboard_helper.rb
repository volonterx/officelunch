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

end
