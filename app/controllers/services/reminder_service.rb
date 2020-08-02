require 'date'

class ReminderService
  #ゴミ出し、ヨガのリマインダー定義
  def initialize(today = Date::today, garbage_service = GarbageService.new, yoga_registration_service = YogaRagistrationService.new)
    @today = today
    @garbage_service = garbage_service
    @yoga_registration_service = yoga_registartion_service
  end

  #check_remindersの呼び出しメソッド
  def execute
    check_reminders
  end

  #各reminderが存在すればremindersに代入していく
  def check_reminders
    reminders = []

    garbage_reminder           = check_garbage_reminder
    yoga_registration_reminder = check_yoga_registration_reminder

    reminders << garbage_reminder           if garbage_reminder.present?
    reminders << yoga_registration_reminder if yoga_registration_reminder.present?

    reminders
  end

  #garbage_serviceよりリマインダーの取得
  def check_garbage_reminder
    @garbage_service.reminder(@today)
  end

  #yoga_registration_serviceよりリマインダーの取得
  def check_yoga_registration_reminder
    @yoga_registration_service.reminder(@today)
  end
end
