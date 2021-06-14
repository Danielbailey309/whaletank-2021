class DropNamesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :names
  end
end
