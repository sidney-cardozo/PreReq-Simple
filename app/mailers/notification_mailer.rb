class NotificationMailer < ApplicationMailer
  default from: 'prereq.official@gmail.com'

  def notification_mail(pair)
    @pair = pair
    @applicant = @pair.applicant
    @applicant_email = User.find(@applicant.user_id).email
    mail(to: @applicant_email, subject: "PreReq - You have been paired !")
  end
end
