class AddUniqueKeyOnCode < ActiveRecord::Migration
  def up
    add_index :airports, :code
  end

  def down
  end
end
