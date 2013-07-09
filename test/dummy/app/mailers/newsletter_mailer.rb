class NewsletterMailer < ActionMailer::Base
  def daily
    mail(
      from: 'from@example.com',
      to: 'to@example.com',
      subject: 'The Far-Eastern Daily'
    )
  end
end
