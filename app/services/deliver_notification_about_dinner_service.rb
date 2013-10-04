# -*- encoding : utf-8 -*-
class DeliverNotificationAboutDinnerService

  attr_accessor :menu

  def initialize(menu_id)
    self.menu = Menu.find(menu_id)
  end

  def send_email_and_create_google_event
    mail_attr = {
      menu: menu,
      courses: menu.courses.map{|d| {name: d.name, category: d.category.name, price: d.price}},
      date_init: date_init_for_menu
    }
    send_email_for_each_user(mail_attr)
    create_events_for_user_who_have_google_token
    menu.update_attribute(:sent, true)
  end

  protected

  def send_email_for_each_user(mail_attr)
    User.find_each do |user|
      UserMailer.send_menu(mail_attr, user).deliver if user.email
    end
  end

  def create_events_for_user_who_have_google_token
    User.find_each do |user|
      create_event_in_google_calendar(user) if user.token_for_refresh_access
    end
  end

  def create_event_in_google_calendar(user)
    RefreshTokenServise.new(user).refresh_token
    client = Google::APIClient.new
    client.authorization.access_token = user.google_token
    service = client.discovered_api('calendar', 'v3')
    event = google_event_attribute
    result = client.execute(
        :api_method => service.events.insert,
        :parameters => {'calendarId' => 'primary'},
        :body => JSON.dump(event),
        :headers => {'Content-Type' => 'application/json'}
    )
  end

  def google_event_attribute
    { 'summary' => I18n.t('back_end.please_ordered_dinner'),
      'start' => {
        'dateTime' => (Time.now + 3.minute)
      },
      'end' => {
        'dateTime' => (Time.now + 1.hour)
      }
    }
  end

  def date_init_for_menu
    month_name = I18n.t('date.common_month_names')[menu.date_init.month]
    menu.date_init.strftime("%d #{month_name} %Y")
  end

end
