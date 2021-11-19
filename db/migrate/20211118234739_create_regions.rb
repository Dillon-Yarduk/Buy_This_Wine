class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :province
      t.string :country

      t.timestamps
    end
  end
end
