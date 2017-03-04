# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Routes Documentation

* Create a User
  POST /create
  https://sleepy-gorge-91783.herokuapp.com/create

  Requires:
  :username (Must not be blank, must be unique)
  :first_name (Must not be blank)
  :last_name (Must not be blank)
  :password (Must not be blank, Less than 72 characters)

  Optional:
  :image (will default to the default chirp avatar)
   --> Will return back to you as :avatar

   Returns:
   :username
   :first_name
   :last_name
   :avatar
   :token

  ERRORS:
  Returns status 400 on an error, with the specific error. (e.g. "Password can't be blank")
 =========
* Login a User
  POST /login
  https://sleepy-gorge-91783.herokuapp.com/login

  Requires:
  :username (Must not be blank)
  :password (Must not be blank, Less than 72 characters)

  Returns:
  :username
  :first_name
  :last_name
  :token
  :avatar
  STATUS: 200

  ERRORS:
  Returns status 401 on an error, with status "You must be signed in to use this page."
 =========
* View a Logged In User's Timeline
 GET /chirps
 https://sleepy-gorge-91783.herokuapp.com/chirps

 Requires:
 :username (Must not be blank)
 :password (Must not be blank, Less than 72 characters)

 Returns:
 * A list of the logged-in user's timeline if provided with a token.
 * If no token is provided it will return a list of all chirps for all users of the system.

 STATUS: 200

 ERRORS:
 N/A
 =========
* Get a list of users
 GET /users
 https://sleepy-gorge-91783.herokuapp.com/users
 Provides a list of all users currently in the system.

 Requires:
 N/A

 Optional:
 N/A

 RETURNS:
  :username
  :first_name
  :avatar

 ERRORS:
 N/A
=========
