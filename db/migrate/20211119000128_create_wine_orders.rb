class CreateWineOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :wine_orders do |t|
      t.integer :quantity
      t.decimal :price
      t.references :wine, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
