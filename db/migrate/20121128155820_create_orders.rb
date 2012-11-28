class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.string  :id_hash, :null => false 
      t.string  :nr
      t.integer :account_id
      t.string  :state
      t.string  :payment_state
      
      t.integer :item_total
      t.integer :total


      t.timestamps
    end
    add_index :orders, :id_hash, :unique => true
  end
end



            


