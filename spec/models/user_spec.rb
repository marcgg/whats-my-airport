require "spec_helper"

describe User do
  describe "generate_trigram" do
    before :each do
      @user = User.new
    end

    it "should generate a trigram and save it if it has an associated airport" do
      Airport.create! code: "MGG"
      @user.name = "Marc G Gauthier"
      @user.generate_trigram
      @user.trigram.should == "MGG"
    end

    it "should try to generate a trigram with the alternative method if no airport is linked" do
      Airport.create! code: "MGA"
      @user.name = "Marc G Gauthier"
      @user.generate_trigram
      @user.trigram.should == "MGA"
    end

    it "should chose primary algorithm for trigram when both possibilities available" do
      Airport.create! code: "MGG"
      Airport.create! code: "MGA"
      @user.name = "Marc G Gauthier"
      @user.generate_trigram
      @user.trigram.should == "MGG"
    end

    it "should save the first algorithm if we really have no result" do
      @user.name = "Marc G Gauthier"
      @user.generate_trigram
      @user.trigram.should == "MGG"
    end
  end

  it "should validate presence of name" do
    User.new.should_not be_valid
    User.new(name: "Bob").should be_valid
  end

  it "should generate trigram on creation" do
    user = User.create! name: "Bob"
    user.trigram.should == "BOB"
  end
end
