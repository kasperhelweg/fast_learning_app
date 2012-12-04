learning_plan_0 = LearningPlan.new(title: "Plan 0")

c0 = Course.find(1)
c1 = Course.find(2)
c2 = Course.find(3)
c3 = Course.find(4)
c4 = Course.find(5)

learning_plan_0.courses << c0
learning_plan_0.courses << c1
learning_plan_0.courses << c2
learning_plan_0.courses << c3
learning_plan_0.courses << c4

learning_plan_0.save!
