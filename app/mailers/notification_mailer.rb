class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomsterh-hayli.herokuapp.com"

  def comment_added
    mail(to: "haylic@hotmail.com", subject: "A comment has been added to your place")
  end
end
