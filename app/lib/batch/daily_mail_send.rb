class Batch::DailyMailSend
  def self.daily_mail_send
    @user = User.all
    @user.each do |user|
      UserMailer.daily_mail(user).deliver
    end
  end
end
