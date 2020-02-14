# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
 I used Sinatra to build the app
- [X] Use ActiveRecord for storing information in a database
ActiveRecord is used for storing info in a database
- [X] Include more than one model class (e.g. User, Post, Category)
I have a User, Plant, and PlantPot class
- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
Users have many plants
- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
Plants belong to a user and plant pots belong to a plant
- [X] Include user accounts with unique login attribute (username or email)
I use username and a password
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
Plants have all of these capabilities.
- [X] Ensure that users can't modify content created by other users
The plant edit button is only visible if the current user is the user who created the plant. Going to the url directly has a check to make sure the current user is the one who created the plant
- [X] Include user input validations
All fields are required to create a new object. routes to edit will check to be sure there's information in the params for a change before making it.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Present.
Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
