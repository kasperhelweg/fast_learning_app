class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|

      t.string :name,                :null => false, :default => ""
      t.string :id_hash,             :null => false
      
      t.timestamps
    end
    add_index :organizations, :id_hash,  :unique => true
    add_index :organizations, :name,     :unique => true
    add_attachment :organizations, :logo
  end
end
