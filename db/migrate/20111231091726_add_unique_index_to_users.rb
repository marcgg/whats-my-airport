class AddUniqueIndexToUsers < ActiveRecord::Migration
  def change
    User.destroy_all
    add_index :users, :name, :unique => true
  end
end
