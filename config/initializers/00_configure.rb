if Rails.env == "production"
  puts "Loading Heroku variables"
  if ENV
    GOOGLE_MAPS_JAVASCRIPT_API_KEY = ENV["GOOGLE_MAPS_JAVASCRIPT_API_KEY"]
    GOOGLE_ANALYTICS_ACCOUNT_NUMBER = ENV["GOOGLE_ANALYTICS_ACCOUNT_NUMBER"]
    SHA1_PASSWORD = ENV["SHA1_PASSWORD"]
  end
else
  puts "Loading config variables from services.yml"
  config = YAML.load(File.open(File.join(Rails.root, "config", "services.yml")))
  GOOGLE_MAPS_JAVASCRIPT_API_KEY  = config["google_maps"]["javascript_api_key"]
  GOOGLE_ANALYTICS_ACCOUNT_NUMBER = config["google_analytics"]["account_number"]
  SHA1_PASSWORD = Digest::SHA1.hexdigest(config["wma"]["password"])
end
