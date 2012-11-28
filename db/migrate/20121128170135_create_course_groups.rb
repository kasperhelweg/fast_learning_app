class CreateCourseGroups < ActiveRecord::Migration
  def change
    create_table :course_groups do |t|
      
      t.integer    :learning_plan_id
      t.integer    :course_id

      t.timestamps
    end
  end
end
