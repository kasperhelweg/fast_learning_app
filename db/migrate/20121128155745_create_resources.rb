class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|

      t.integer :attachable_id
      t.string  :attachable_type

      t.timestamps
    end
    add_attachment :resources, :resource
  end
end
