module ApplicationHelper
  def formatted_time(time)
  	formatted_date(time) + time.strftime(" at %l:%M %p")
    #time.strftime("%B %d, %Y at %l:%M %p")
  end

  def formatted_date(time)
    time.strftime("%B %d, %Y")
  end
end
