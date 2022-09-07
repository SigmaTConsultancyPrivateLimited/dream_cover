class CreateProductStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :product_stocks do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :total_stock
      t.float :unit_price
      t.float :total_price

      t.timestamps
    end
  end
end
