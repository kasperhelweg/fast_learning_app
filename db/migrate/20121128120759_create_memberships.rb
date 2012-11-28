class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|

      t.integer :user_id,           :null => false
      t.integer :learning_space_id, :null => false

      t.timestamps
    end
    add_index :memberships, [:user_id, :learning_space_id], :unique => true
  end
end
