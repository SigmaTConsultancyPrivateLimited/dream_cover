class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.string :complete_address
      t.string :pincode 
      t.string :phone_number, unique:true
      t.timestamps
    end
  end
end
