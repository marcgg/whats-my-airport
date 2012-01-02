require "spec_helper"

describe Airport do
  describe "check_airport" do
    before :each do
      @airport = Airport.new
    end

    it "should know if the airport is a railway station based on its name" do
      @airport.name = "John Doe Railway Stn."
      @airport.is_railway_station?.should be_true
      @airport.name = "John Doe Rail"
      @airport.is_railway_station?.should be_true
      @airport.name = "John Doe Airport"
      @airport.is_railway_station?.should be_false
      @airport.name = "Railman airport"
      @airport.is_railway_station?.should be_false
      @airport.name = "Johnrail airport"
      @airport.is_railway_station?.should be_false
    end
  end
end
