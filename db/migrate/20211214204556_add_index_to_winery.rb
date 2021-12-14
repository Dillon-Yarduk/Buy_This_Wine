class AddIndexToWinery < ActiveRecord::Migration[6.1]
  def change
    add_index :wineries, :name, unique: true
  end
end
