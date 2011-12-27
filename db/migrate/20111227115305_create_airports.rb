class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports, id: false, primary_key: :code do |t|
      t.string :code
      t.string :name
      t.string :city
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :country_code

      t.timestamps
    end
  end
end
