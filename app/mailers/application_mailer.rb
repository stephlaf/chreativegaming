class ApplicationMailer < ActionMailer::Base
  default from: 'info@chreativegaming.com'
  layout 'mailer'

  rescue_from(Postmark::InactiveRecipientError) do |ex|
    redirect_to root_path, alert: 'Your email seems to be invalid...'
    # logger.error("Postmark error (#{ex.class} code #{ex.error_code}) on delivery attempt:\n#{ex.message}")
    # Rollbar.error(ex)
  end
end
