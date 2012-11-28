class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      
      t.string   :name
      t.integer  :price
      t.integer  :buyable_id
      t.string   :buyable_type

      t.timestamps
    end
  end
end
