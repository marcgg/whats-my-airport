require "csv"

namespace :import_data do
  desc "Read data/codes.csv and store it in the database. Warning: This will drop the current airport data"
  task run: :environment do
    puts "Deleting all airports"
    Airport.delete_all

    puts "Importing from file"
    CSV.foreach(File.join(Rails.root, "data/codes.csv")) do |row|
      puts row.inspect
      Airport.create!(
        code: row[0],
        name: row[1],
        city: row[2],
        country: row[3],
        country_code: row[4],
        latitude: row[5],
        longitude: row[6]
      )
    end

    puts "All done!"
  end
end
