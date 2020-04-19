
-models

  -user -> has many trips, has many parks through trips
  -park -> has many trips, has many users through trips
  -trip -> belongs to a user, belongs to a park


-controllers/views

  -index -> Shows all parks with add a trip button
    -if logged in? - header shows tabs and profile info
    -not logged in - header shows tabs and login/sign-up links

  -/user/

    -login -> email/password form

    -sign_up -> name/email/password form

    -show -> displays user info and trips with links to park pages, link to edit trip, link to edit user
