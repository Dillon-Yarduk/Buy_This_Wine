class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :gst
      t.decimal :pst
      t.decimal :hst
      t.decimal :total
      t.references :customer, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
