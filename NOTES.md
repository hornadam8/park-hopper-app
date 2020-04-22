TODO: various users/trips edit/delete
TODO: rubric review

Extra TODO: css styling
Extra TODO: Park.chunk(3) to create nicer index layout
Extra TODO: add image to park scraper
        -then rollback seeds and migrations and reset

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
