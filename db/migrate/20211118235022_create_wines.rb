class CreateWines < ActiveRecord::Migration[6.1]
  def change
    create_table :wines do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :winery, null: false, foreign_key: true
      t.references :variety, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
