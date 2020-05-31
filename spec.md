# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category) - User, Workout, Exercise models used.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has many workouts.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Workout has and belongs to many exercises.
- [x] Include user accounts with unique login attribute (username or email) = Email and username validations in User model.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Ensure that users can't modify content created by other users
- [x] Include user input validations = Exercise name validations in model, also validations made in views using html(example: "type = 'email'") 
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
