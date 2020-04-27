Extra TODO: search bar

-models

  -user -> has many trips, has many parks through trips
  -park -> has many trips, has many users through trips
  -trip -> belongs to a user, belongs to a park


-controllers/views

  -index(user login/signup)

  -parks
    /parks -> Shows all parks with User info and trips in sidebar

    /parks/:id -> shows park page with add trip button

  -users

    -show -> displays user info and trips with links to park pages, link to edit trip, link to edit user

    -edit -> displays user info and allows for edits

    -delete -> button in edit page destroys user from db
