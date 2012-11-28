class CreateLearningSpaces < ActiveRecord::Migration
  def change
    create_table :learning_spaces do |t|

      t.string  :id_hash,          :null => false
      t.string  :name,             :null => false

      t.integer :organization_id,  :null => false
      

      t.timestamps
    end
    add_index :learning_spaces, :organization_id
    add_index :learning_spaces, :id_hash, :unique => true
  end
end
