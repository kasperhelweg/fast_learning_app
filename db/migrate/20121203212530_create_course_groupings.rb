class CreateCourseGroupings < ActiveRecord::Migration
  def change
    create_table :course_groupings do |t|

      t.integer    :learning_plan_id
      t.integer    :course_id


      t.timestamps
    end
  end
end
