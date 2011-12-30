class User < ActiveRecord::Base
  belongs_to :airport, foreign_key: :trigram, primary_key: :code

  validates_presence_of :name

  before_create :generate_trigram

  def generate_trigram
    trigram, airport = nil, nil
    [:regular, :alternative, :only_last, :only_first].each do |algorithm|
      trigram = Trigram.generate(name, algorithm)
      airport = Airport.first(conditions: {code: trigram})
      break if airport
    end
    trigram = Trigram.generate(name) unless airport
    self.trigram = trigram
  end

  def has_big_trigram?
    trigram =~ /.*(M|W).*/i
  end

  def increment_hits!
    update_attributes!(hits: (hits + 1))
  end
end
