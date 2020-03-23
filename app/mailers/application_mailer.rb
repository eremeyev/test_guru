class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default from: %{"TestGuru" <mail@testguru.com>},
          to: "andrey.eremeyev@gmail.com"
  
  def submit_feedback(text)
    mail subject: 'Feedback', body: text
  end

end
