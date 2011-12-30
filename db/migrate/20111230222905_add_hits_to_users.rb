class AddHitsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hits, :integer, default: 0
  end
end
