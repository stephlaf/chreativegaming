require_relative 'stripe_checkout_session_service'

if Rails.env.development?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key:      ENV['STRIPE_SECRET_KEY'],
    signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY_LOCAL']
  }
else
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key:      ENV['STRIPE_SECRET_KEY'],
    signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY_DEVELOPMENT']
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

StripeEvent.configure do |events|
  pp events
  events.subscribe 'checkout.session.completed' do |event|
    StripeCheckoutSessionService.new.call(event)
  end
end
