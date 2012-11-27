class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|

      t.string :name,         :null => false

      t.timestamps
    end
    add_index :organizations, :name,  :unique => true
  end
end
