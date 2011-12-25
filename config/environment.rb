# Load the rails application
require File.expand_path('../application', __FILE__)
Dir[Rails.root + 'lib/**/*.rb'].each do |file|
  require file
end

# Initialize the rails application
AirportCodes::Application.initialize!
