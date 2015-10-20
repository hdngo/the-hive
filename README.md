# The Hive

##Description
The Hive is a social media networking platform catered towards the students who were members of the San Francisco Bumblebees Cohort. Through The Hive, users are able to friend request one another, view each other's profiles, upload images to a gallery, and message one another.

[View it on Heroku!](https://the-hive-sf.herokuapp.com)

##Technologies Used
  * Backend: Ruby, ActiveRecord, Sinatra, SQLite3
  * Frontend: Javascript (jQuery, AJAX), HTML, CSS, and Bootstrap
  * Note: Originally, the Gravtastic Ruby gem was included, but because there were issues deploying the app to Heroku with it, it was removed, hence the default Bumblebee profile images.
  * Hexagon-grid credits to Stack Overflow user [web-tiki](http://stackoverflow.com/users/1811992/web-tiki)


##User Stories
  * A user can sign up for a new account.
  * A user can login with an existing account.
  * A user can navigate to and view his/her own profile.
  * A user can edit his/her own profile.
  * A user can search for other users.
  * A user can friend other users.
  * A user can accept/ignore friend requests.
  * A user can message other users.
  * A user can delete messages.
  * A user can upload images given a valid URL.
  * A user can edit their image details.
  * A user can view the photo gallery.
 
 
##Screenshots
![home](https://github.com/hdngo/the-hive/blob/master/the-hive-screenshots/home-screen.png?raw=true)
![profile](https://github.com/hdngo/the-hive/blob/master/the-hive-screenshots/profile.png?raw=true)
![message](https://github.com/hdngo/the-hive/blob/master/the-hive-screenshots/message.png?raw=true)
![inbox](https://github.com/hdngo/the-hive/blob/master/the-hive-screenshots/inbox.png?raw=true)
![gallery](https://github.com/hdngo/the-hive/blob/master/the-hive-screenshots/hex-gallery.png?raw=true)

##Challenges I Faced
  * Handling friend requests

##Next Steps
  * Facilitate live communication between our users.
  * More responsive/interactive photo gallery
  * Profile image upload
  * More validations

##Run The Hive Locally:
Via the Command Line
  1. Clone the repo - 'git clone https://github.com/hdngo/the-hive.git'
  2. Run - 'bundle exec shotgun' to start up a server on localhost:9000
