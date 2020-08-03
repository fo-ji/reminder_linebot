class WebhookController < ApplicationController
  #API 機能の場合はCSRFの対策は必要なし
  protect_from_forgery with: :null_session

  def callback
    logger.info(params)
  end

  def reminder
    reminders = get_reminders
    logger.info(reminders)
    #文字列をログファイルに書き出す

    reminders.each do |reminder|
      res = line_client.push(reminder)
      logger.info(res.body)
      #line_clientsにpushした文字列をログファイルに書き出す
    end
  end

  #クラス内のみアクセス
  private
  
  def get_reminders
    reminder_service.execute
    #ReminderServiceをnewして、reminder_service.rbのexecuteを呼び出し
  end

  def reminder_service
    ReminderService.new
  end

  def line_client
    @line_clinet ||= LineClient.new
  end
end
