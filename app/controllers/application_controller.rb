# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  #before_filter :authenticate_member!

end
