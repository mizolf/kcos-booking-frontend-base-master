module TermsHelper
  def interval_string(interval)
    "#{hours_from_mins(interval[0])} - #{hours_from_mins(interval[1])}"
  end

  def hours_from_mins(mins)
    "#{(mins/60).to_s.rjust(2, "0")}:#{(mins%60).to_s.rjust(2, "0")}"
  end

  def mins_from_hours(hours)
    hours.split(":")[0].to_i*60+hours.split(":")[1].to_i
  end

  def time_select(from=0, to=1440)
  	(from/30..to/30).map do |time|
  		[hours_from_mins(time*30), time*30]
  	end
  end

  def in_any_of_intervals?(time, intervals)
    true.in? intervals.map{ |i| time.between?(i[0], i[1]) }
  end

  def timestamp(datetime)
    datetime.strftime('%d.%m.%Y. %H:%M')
  end

  def format_date(date)
    date.strftime('%d.%m.%Y.')
  end
end