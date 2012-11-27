class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|

      t.string  :title,          :null => false
      t.text    :content
      
      t.integer :pageable_id
      t.string  :pageable_type

      t.timestamps
    end
  end
end
