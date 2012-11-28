class CreateLearningPlans < ActiveRecord::Migration
  def change
    create_table :learning_plans do |t|

      t.string :id_hash,            :null => false
      t.string :title,              :null => false
      t.string :short_desc
      t.text :desc

      t.timestamps
    end
    add_index :learning_plans, :id_hash,   :unique => true
  end
end
