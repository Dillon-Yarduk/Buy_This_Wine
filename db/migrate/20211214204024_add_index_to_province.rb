class AddIndexToProvince < ActiveRecord::Migration[6.1]
  def change
    add_index :provinces, :name, unique: true
  end
end
