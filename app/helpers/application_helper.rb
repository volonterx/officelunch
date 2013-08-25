# -*- encoding : utf-8 -*-
module ApplicationHelper
  def date_with_weekday(date)
    s = Russian::strftime(date, "%A, %d %B")
    s.mb_chars.downcase.to_s
  end
end
