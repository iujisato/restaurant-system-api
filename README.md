# Open Ristorant API

This is a test application made with rails api

### Installation
1. Download and install `docker` and `docker-compose`.
2. On the project folder, run:
```
  docker-compose build
```
3. After database migrations:
```
  docker-compose up
```
4. After successfullying building, run:
```
docker-compose run api rails db:create db:migrate db:seed
```
5. Access the application on:
```
localhost:3000
```
6. Generate a `config/master.key` with the provided hash. This key is used on
   `Pexel API` to generate random image paths.

7. Run tests with
```
rake tests
```
### Troubleshooting
1. You can start `pry` debugger attaching a docker session to container.
```
docker ps
docker attach (container_id)
```
