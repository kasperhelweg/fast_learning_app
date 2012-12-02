# Den svære samtale
course = Course.find(5)

course.classrooms.build(
                        online_date: Date.today + 4 )

course.classrooms.build(
                        online_date: Date.today + 14 )

course.classrooms.build(
                        online_date: Date.today + 21 )

course.save

# Teamledelse
course = Course.find(2)


course.classrooms.build(
                        online_date: Date.today + 34 )

course.classrooms.build(
                        online_date: Date.today + 21 )

course.classrooms.build(
                        online_date: Date.today + 10 )

course.save

# Mødeledelse
course = Course.find(7)


course.classrooms.build(
                        online_date: Date.today + 11 )

course.classrooms.build(
                        online_date: Date.today + 16 )

course.classrooms.build(
                        online_date: Date.today + 9 )

course.save

