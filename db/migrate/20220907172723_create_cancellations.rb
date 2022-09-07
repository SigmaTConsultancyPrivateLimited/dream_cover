class CreateCancellations < ActiveRecord::Migration[7.0]
  def change
    create_table :cancellations do |t|
      t.date :cancellation_date
      t.references :purchase_record, null: false, foreign_key: true
      t.float :refund_amount

      t.timestamps
    end
  end
end
