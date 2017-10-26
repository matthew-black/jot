module DateFormatting
    #--Input: timestamp. Output: October 23, 2017--#
  def long_form_date(timestamps)
    timestamps.strftime('%B %e, %Y')
  end
    #--Input: timestamp. Output: 15:45--#
  def long_form_time(timestamp)
    timestamp.strftime('%H:%M')
  end
end

helpers DateFormatting
