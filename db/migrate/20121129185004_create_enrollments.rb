class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      
      t.string  :id_hash,          :null => false
      t.integer :classroom_id
      t.integer :user_id,          :null => false         
      t.integer :course_id,        :null => false     
      t.string  :status,           :null => false             

      t.timestamps
    end
    add_index( :enrollments, [:user_id, :course_id, :classroom_id], :unique => true )
    add_index( :enrollments, :id_hash, :unique => true )
  end
end
