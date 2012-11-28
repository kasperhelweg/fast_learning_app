class CreateLearningPlans < ActiveRecord::Migration
  def change
    create_table :learning_plans do |t|

      t.timestamps
    end
  end
end
