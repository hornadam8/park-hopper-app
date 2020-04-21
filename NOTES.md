TODO: fix env
TODO: user authentication
TODO: various controllers/views

Extra TODO: Park.chunk(3) to create nicer index layout
Extra TODO: add image to park scraper
        -then rollback seeds and migrations and reset

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
