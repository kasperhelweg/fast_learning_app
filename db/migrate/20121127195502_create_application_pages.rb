class CreateApplicationPages < ActiveRecord::Migration
  def change
    create_table :application_pages do |t|

      t.string   :location,     :null => false

      t.timestamps
    end
    add_index :application_pages, :location
  end
end
