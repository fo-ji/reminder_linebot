namespace :reminder do
  desc "LineBot_run"
  task :reminder_task => :environment do
    webhook_controller = WebhookController.new
    webhook_controller.reminder
  end
end
