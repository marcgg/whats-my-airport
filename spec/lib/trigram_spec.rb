# encoding: utf-8
require "spec_helper"

describe Trigram do
  it "should return a trigram given all data needed" do
    Trigram.generate("Marc Gabriel Gauthier").should == "MGG"
  end

  describe "complex cases" do
    it "should work when given incomplete data" do
      Trigram.generate("Marc Gauthier").should == "MGA"
      Trigram.generate("Marc").should == "MAR"
      Trigram.generate(nil).should == nil
    end

    it "should work with complex names" do
      Trigram.generate("Jean-Marc Gauthier").should == "JMG"
      Trigram.generate("De La Gauthier").should == "DLG"
      Trigram.generate("Jean-Marc De La Gauthier").should == "JMG"
      Trigram.generate("Jean-Marc De La Haute Gauthier").should == "JHG"
      Trigram.generate("Jean-Marc").should == "JMA"
    end

    it "should ignore small words only if we have enough data" do
      Trigram.generate("Jean De La Gauthier").should == "JGA"
      Trigram.generate("De La Gauthier").should == "DLG"
      Trigram.generate("La Gauthier").should == "LGA"
    end

    it "should handle accents and lower case letters" do
      Trigram.generate("étienne").should == "ETI"
      Trigram.generate("marc gauthier").should == "MGA"
    end
  end

  describe "remove_small_words" do
    it "should remove small words (duh)" do
      Trigram.remove_small_words("Marc G Gauthier").should == "Marc Gauthier"
      Trigram.remove_small_words("Jean-Charles de la Haute").should == "Jean-Charles Haute"
      Trigram.remove_small_words("Jean-Charles du Chateau de la Haute Bourgeoisie").should == "Jean-Charles Chateau Bourgeoisie"
    end
  end
end
