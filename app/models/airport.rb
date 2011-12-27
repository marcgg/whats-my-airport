class Airport < ActiveRecord::Base
  has_many :users, foreign_key: :trigram, primary_key: :code
end
