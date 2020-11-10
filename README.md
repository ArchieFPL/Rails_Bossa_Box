[![Build Status](https://travis-ci.com/ArchieFPL/Rails_Bossa_Box.svg?branch=master)](https://travis-ci.com/ArchieFPL/Rails_Bossa_Box)

# README

Api developed for the BossaBox backend challenge.

## Ruby Version
2.7.2

## Starting the project
Both postgres and the API are in the docker-compose, just follow the instructions below to be able to run the app.

```sh
docker-compose build
```

```sh
docker-compose run web bundle exec rails db:create
```

```sh
docker-compose run web bundle exec rails db:migrate
```
```sh
docker-compose up --build
```

The API is on port 3000

## Test
To run the tests just run the following command
```sh
docker-compose run web bundle exec rspec
```
## Documentation
You will find the documentation at
http://localhost:3000/api-docs/
Note that in Schemas where tags are present, it is actually an array of strings and not a string (bug related to the rails parser for yml, I'm looking for solutions)
