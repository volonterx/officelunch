# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

  before_filter :authenticate_user!
  protect_from_forgery with: :exception
  #before_filter :authenticate_member!

end
