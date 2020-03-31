class UserNotifierEmailMailer < ApplicationMailer
  default :from => "noreply@helpaneighbor.ca"

  def send_new_help_request_near_you_notification(help_request)
    @help_request = help_request
    mail({
      subject: "helpaneighbor.ca - Someone needs help near you!",
      bcc: ["lalandej.gg@gmail.com"],
    })
  end
end
