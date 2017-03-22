# README

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
* Follow a User
POST /users/follow/:username
 https://sleepy-gorge-91783.herokuapp.com/users/follow/:username

 Follows a target user.

 Requires:
 :username (username to be followed)
 :token (current user's token)

 RETURNS:
  [`current_user has followed target_user`], Status 200

 ERRORS:
  [`current_user is already following target_user`], Status 200
=========

* POST /users/unfollow/:username
 https://sleepy-gorge-91783.herokuapp.com/users/unfollow/:username

 Unfollows a target user.

 Requires:
 :username (username to be unfollowed)
 :token (current user's token)

 RETURNS:
  [`current_user has unfollowed target_user`], Status 200

 ERRORS:
  [`current_user is not following target_user`], Status 200
=========

* GET /chirps/timeline

Requires:
Does not require any parameters

Optional:
No optional parameters

ERRORS:
No specific error messages.

Returns a list of all chirps on the site.

=========

* GET /chirps/paginate/:page
https://sleepy-gorge-91783.herokuapp.com/chirps

Requires:
 :token (current user's token)
 :page (starts at 1, default results per page 25, if it exceeds the user's posts, will return null)

Returns:
 * A list of the logged-in user's timeline ordered by most recent post.

ERRORS:
* If no token is provided it will return a JSON formatted message of "You must be logged in to do this."

STATUS: 200

ERRORS:
 N/A
