# README

Kredi Challenge, cutting links

Rails version: 6.1.4
Ruby version: 3.0.0

Using sqlite3 in development mode

# Get Started

Run
````
$ bundle install
````

Run migrations and gen seeders
````
$ rails db:migrate db:seed
````
Is running in port: 3000 

# Routes

POST /login => {'email' : "enrique@mail.com", password: "password"}.   
  #response: {user_obj : object, "token": "XXXXXX-XXXXX"}
 - REQUIERE LOGIN headers => Authorization (Bearer + "token")
  - POST /users => {'email' : "enrique@mail.com", password: "password"} #new_user
    
    #response user(object)
  - POST /links => {'full' : "http://link_test.com"} #new_link

    #response { "id": 1, "full": "http://link_test.com", "short": `"hHvvUe"`, "total_views": int}
        
  - GET /links #links_index

    #respose [{"id": 1,"full": "http://link_test.com","short": "hHvvUe","total_views": 1}]
    
  - GET /links/:id/views #links_index

    #response [{ "operative_system": "Macintosh", "browser": "Chrome", "ip_address": "187.189.127.233", "date": "2022-01-19 - 12:23:08"}]
    
# Use short
Go to url /code
````
localhost:3000/:code
````
redirect to full_link

# Deploy

Using API from https://kredichallenge.herokuapp.com
Heroku Deploy, db: postgres
credentials
````
mail: enrique@mail.com
password: password
````
