class CreateBillings < ActiveRecord::Migration[7.0]
  def change
    create_table :billings do |t|
      t.date :date
      t.string :card_type
      t.string :card_number
      t.string :card_exp_date
      t.date :delivery_date
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
