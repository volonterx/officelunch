class CompletionOrderService

  attr_accessor :orders

  def initialize
    self.orders = Order.today
  end

  def get_order_params_and_closed_user_orders
    update_order_status
    {
      user: get_user_orders_data,
      total_courses_sum: get_courses_sum,
      need_order: get_courses_count,
      total_sum: orders.sum(:sum)
    }
  end

  def get_user_orders_data
    params = {}
    User.all.each do |u|
      params[u.name] = u.today_order if u.today_order
    end
    params
  end

  def get_courses_sum
    orders.joins(:courses).joins(:courses).group("courses.name").sum(:price)
  end

  def get_courses_count
    orders.joins(:courses).joins(:courses).group("courses.name").count
  end

  def update_order_status
    orders.update_all(closed: true) if orders.count == User.count && !orders.first.closed
  end

end