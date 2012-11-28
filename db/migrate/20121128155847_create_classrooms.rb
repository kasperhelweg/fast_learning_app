class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|

      t.string :id_hash
      
      t.date :starts,                  :null => false
      t.date :ends,                    :null => false
      t.date :online_date,             :null => false
      
      t.integer :course_id,            :null => false
   
      t.timestamps
    end
    add_index :classrooms, :id_hash, :unique => true
  end
end
