class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      
      t.integer :order_id
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
