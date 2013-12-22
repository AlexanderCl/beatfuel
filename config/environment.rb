# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Beatfuel::Application.initialize!

# Variables
ENV['FACEBOOK_APP_ID'] = 'devuser'
ENV['FACEBOOK_SECRET'] = 'devpass'
