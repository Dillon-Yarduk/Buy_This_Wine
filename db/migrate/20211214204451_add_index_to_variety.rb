class AddIndexToVariety < ActiveRecord::Migration[6.1]
  def change
    add_index :varieties, :name, unique: true
  end
end
