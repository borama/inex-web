module NewsletterAdmin
  
  def self.subscribe(email)
    ActionMailer::Base.raise_delivery_errors = true
    ActionMailer::Base.logger = RAILS_DEFAULT_LOGGER
    #ActionMailer::Base.logger.level = 0
    
    mail = TMail::Mail.new
    mail.subject = 'subscribe'
    mail.body = 'subscribe'
    mail.to = Parameter::get_value('newsletter_subscription_email')
    mail.set_content_type("text", "plain")
    mail.from = email
    mail.sender = email
    mail.reply_to = email
    ActionMailer::Base.deliver(mail)
  end
  
end
