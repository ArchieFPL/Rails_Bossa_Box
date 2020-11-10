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
