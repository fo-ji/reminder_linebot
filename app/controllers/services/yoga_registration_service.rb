require 'date'

class YogaRegistrationService
  def reminder(today)
    day_of_week = today.wday
    week_of_month = get_week_of_month(today)

    case day_of_week
      when 0
        "ところでヨガの次の予約した？"
      when 1
        "テスト！！"
      when 3
        "ストレッチだけでもしとこっか？"
      else
        ''
      end
  end

  private

  def get_week_of_month(today)
    first_week = (today - (today.day - 1)).cweek
    this_week = today.cweek
  
    # 年末の暦週調整
    if this_week < first_week
      if today.month == 12
        return get_week_of_month(today - 7) + 1
      else
        return this_week + 1
      end
    end
    return this_week - first_week + 1
  end
end
