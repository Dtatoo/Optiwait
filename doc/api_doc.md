# API Documentation

## Tasks to Handle
1. Create user
2. Authenticate user
    - admin auth
    - clinic auth
3. JWT Token
4. User WaitTime Post
5. Clinics data JSON

## API Path
__Edit__ : any PUT-like calls
___Base___
/api

__users__
GET /users -- ??
POST /users -- creates new user with `is_admin :: Bool` or `is_clinic :: Bool` in database

GET /users/:id -- TODO: sort by `is_clinic` and get all properties from clinic model __SCRAPED__
scraped in favor of useing different route `/clinics/:id`

EDIT /users/:id __SCRAPED__
DELETE /users/:id -- maybe or just use flag

__login__
POST /login -- authentication and return JWT user can use

__clinics__
GET /clinics -- get info and wait time to display
GET /clinics/:id

POST /clinics/:id -- Clinic Info (without wait time)

__waittime__
POST /clinics/waitTime/:id -- WAIT TIME! limit databaste storage by time instead of row so we can keep a time as data

TODO: some sort of authentication layer to store data (maybe needed?)
