if Rails.env == "production"
  puts "Loading Heroku variables"
  GOOGLE_MAPS_JAVASCRIPT_API_KEY  = ENV["GOOGLE_MAPS_JAVASCRIPT_API_KEY"] if ENV
else
  puts "Loading config variables from services.yml"
  config = YAML.load(File.open(File.join(Rails.root, "config", "services.yml")))
  GOOGLE_MAPS_JAVASCRIPT_API_KEY  = config["google_maps"]["javascript_api_key"]
end
