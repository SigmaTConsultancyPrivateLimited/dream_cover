class CreatePurchaseRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_records do |t|
      t.integer :quantity
      t.float :price
      t.references :billing, null: false, foreign_key: true
      t.float :discount
      t.string :status

      t.timestamps
    end
  end
end
