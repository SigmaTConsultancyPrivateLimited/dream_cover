class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_code
      t.references :category, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true
      t.string :category_name
      t.string :subcategory_name
      t.string :product_image
      t.integer :sku
      t.float :price

      t.timestamps
    end
  end
end
