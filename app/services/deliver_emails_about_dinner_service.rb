# -*- encoding : utf-8 -*-
class DeliverEmailsAboutDinnerService

  attr_accessor :menu

  def initialize(menu_id)
    self.menu = Menu.find(menu_id)
  end

  def send_email_and_update_menu_status
    mail_attr = {
      menu: menu,
      courses: menu.courses.map{|d| {name: d.name, category: d.category.name, price: d.price}},
      date_init: date_init_for_menu
    }
    User.find_each do |user|
      UserMailer.send_menu(mail_attr, user).deliver if user.email
    end
    menu.update_attribute(:sent, true)
  end

  protected

  def date_init_for_menu
    month_name = I18n.t('date.common_month_names')[menu.date_init.month]
    menu.date_init.strftime("%d #{month_name} %Y")
  end

end
