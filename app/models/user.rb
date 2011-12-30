class User < ActiveRecord::Base
  belongs_to :airport, foreign_key: :trigram, primary_key: :code

  validates_presence_of :name

  before_create :generate_trigram

  def generate_trigram
    trigram = Trigram.generate(name)
    airport = Airport.first(conditions: {code: trigram})
    if airport.nil?
      second_trigram = Trigram.generate(name, :alternative)
      airport = Airport.first(conditions: {code: second_trigram})
      trigram = second_trigram if airport
    end
    self.trigram = trigram
  end

  def has_big_trigram?
    trigram =~ /.*(M|W).*/i
  end
end
