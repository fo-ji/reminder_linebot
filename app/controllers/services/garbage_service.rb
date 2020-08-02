require 'date'

class GarbageService
  #0 = 日曜日, 1 = 月曜日, 2 = 火曜日, 3 = 水曜日, 4 = 木曜日, 5 = 金曜日, 6 = 土曜日
  def reminder(today)
    #曜日取得
    day_of_week = today.wday
    #週間取得
    week_of_month = get_week_of_month(today)

    case day_of_week
      when 0, 3
        "明日は燃えるゴミの日です！"
      when 2
        "明日はダンボールとプラの日です！"
      when 4
        "明日はびん・缶・ペットボトルの日です！"
        if week_of_month == 2 || week_of_month == 4
          "不燃ゴミも忘れないで！"
        end
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
