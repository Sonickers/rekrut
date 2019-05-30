def check_if_leap_year?(year)
  year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

def get_days_for_month(month, year)
  case
  when [1, 3, 5, 7, 8, 10, 12].include?(month)
    31
  when [4, 6, 9, 11].include?(month)
    30
  when 2
    if check_if_leap_year?(year)
      29
    else
      28
    end
  else
    nil
  end
end

def prop_date(year, month, day)
  if year.between?(2001, 2099) && month.between?(1, 12)
    if day.between?(1, get_days_for_month(month, year))
      return true
    else
      false
    end
  else
    false
  end
end