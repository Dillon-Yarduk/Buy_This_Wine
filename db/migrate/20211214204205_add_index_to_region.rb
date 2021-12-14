class AddIndexToRegion < ActiveRecord::Migration[6.1]
  def change
    add_index :regions, :name, unique: true
  end
end
