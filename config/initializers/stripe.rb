if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_RF49KdtpbvIYA5EloZCWJT1T',
    secret_key: 'sk_test_NktMo4XuoTg1u0GeUoddRRha'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
