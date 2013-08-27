# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
  default from: 'office-lunch@example.com'

  def send_menu(mail_attributes, user)
    @mail_attr = mail_attributes
    @user = user
    mail(:to => @user.email, :subject => I18n.t('mailer.send_menu.date_init') + " #{@mail_attr[:date_init]}" )
  end

end
