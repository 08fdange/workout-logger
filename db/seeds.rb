#Users
user1 = User.create(email: "08fdange@gmail.com", username: "08fdange", password: "password123")
user2 = User.create(email: "johndoe@gmail.com", username: "johndoe", password: "password123")
user3 = User.create(email: "jonsmith@yahoo.com", username: "jonsmith", password: "password123")
user4 = User.create(email: "shannond@gmail.com", username: "shannond", password: "password123")
user5 = User.create(email: "janedoe@gmail.com", username: "janedoe", password: "password123")

#Workouts
workout1 = Workout.create(title: "Strong Leg Workout", user_id: 1)
workout2 = Workout.create(title: "Back Breaking Workout", user_id: 3)
workout3 = Workout.create(title: "Chest Development Workout", user_id: 2)
workout4 = Workout.create(title: "Full Body Workout", user_id: 4)
workout5 = Workout.create(title: "Arm Workout", user_id: 1)
workout6 = Workout.create(title: "Crazy Workout", user_id: 5)

#Exercises

exercise1 = Exercise.create(exercise_name: "Bench Press", description: "The bench press is an upper-body weight training exercise in which the trainee presses a weight upwards while lying on a weight training bench.", exercise_type: "Chest")
exercise2 = Exercise.create(exercise_name: "Squat", description: "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up.", exercise_type: "Legs")
exercise3 = Exercise.create(exercise_name: "Deadlift", description: "The deadlift is a weight training exercise in which a loaded barbell or bar is lifted off the ground to the level of the hips, torso perpendicular to the floor, before being placed back on the ground.", exercise_type: "Back")
exercise4 = Exercise.create(exercise_name: "Chest Dips", description: "The chest dip is a bodyweight exercise performed on parallel bars or on a pull-up and dip station. It targets the chest, triceps, and shoulders.", exercise_type: "Chest")
exercise5 = Exercise.create(exercise_name: "Walking Lunge", exercise_type: "Legs")
exercise6 = Exercise.create(exercise_name: "Calf Raises", exercise_type: "Legs")
exercise7 = Exercise.create(exercise_name: "Bent-Over Row", description: "A bent-over row is a weight training exercise that targets a variety of back muscles. Which ones are targeted varies on form.", exercise_type: "Back" )
exercise8 = Exercise.create(exercise_name: "Dumbbell Incline Fly", exercise_type: "Chest")
exercise9 = Exercise.create(exercise_name: "Leg Press", exercise_type: "Legs")
exercise10 = Exercise.create(exercise_name: "Incline Press", exercise_type: "Chest")
exercise11 = Exercise.create(exercise_name: "Pull ups", exercise_type: "Back")
exercise12 = Exercise.create(exercise_name: "Decline Press", exercise_type: "Chest")
