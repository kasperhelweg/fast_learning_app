class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|

      t.string  :name

      t.integer :accountable_id
      t.string  :accountable_type

      t.timestamps
    end
  end
end
