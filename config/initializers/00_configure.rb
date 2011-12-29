puts "Loading config variables from services.yml"
config = YAML.load(File.open(File.join(Rails.root, "config", "services.yml")))

GOOGLE_MAPS_JAVASCRIPT_API_KEY  = config["google_maps"]["javascript_api_key"]
