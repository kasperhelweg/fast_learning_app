class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|

      t.string :id_hash,            :null => false
      t.string :title,              :null => false
      t.string :short_desc
      t.text :desc
      
      t.string :color

      t.timestamps
    end
    add_index :courses, :id_hash,   :unique => true
  end
end
