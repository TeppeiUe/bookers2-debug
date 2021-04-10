require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = Rails.env.to_sym
set :environment, rails_env
set :output, 'log/cron.log'
every 1.days, at: '9:00 am' do
  begin
    runner "Batch::DailyMailSend.daily_mail_send"
  rescue => e
    Rails.logger.error("aborted rails runner")
    raise e
  end
end