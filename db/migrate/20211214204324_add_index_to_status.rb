class AddIndexToStatus < ActiveRecord::Migration[6.1]
  def change
    add_index :statuses, :name, unique: true
  end
end
