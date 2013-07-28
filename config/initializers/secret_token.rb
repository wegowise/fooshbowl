# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
if Rails.env.development? || Rails.env.test?
  Fooshbowl::Application.config.secret_key_base = ('x' * 30)
else
  Fooshbowl::Application.config.secret_key_base = ENV['SECRET_TOKEN']
end
