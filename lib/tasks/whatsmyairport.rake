namespace :whatsmyairport do

  desc "Helper to set Heroku variables"
  task :heroku_vars => :environment do
    puts "Reference here: http://devcenter.heroku.com/articles/config-vars"
    puts "heroku config:add GOOGLE_MAPS_JAVASCRIPT_API_KEY=#{GOOGLE_MAPS_JAVASCRIPT_API_KEY} SHA1_PASSWORD=#{SHA1_PASSWORD}"
  end

end
