class Airport < ActiveRecord::Base
  has_many :users, foreign_key: :trigram, primary_key: :code
  set_primary_key :code
  attr_accessible :code # cuz I'm crazy like that

  def is_railway_station?
    self.name =~ /.+ rail.*/i
  end
end
