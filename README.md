# Open Ristorant API

This is a test application made in react.

### Installation
1. Download and install `docker` and `docker-compose`.
2. On the project folder, run:
```
  docker-compose build
```
3. After successfullying building, run:
```
docker-compose run api rails db:create db:migrate db:seed
```
3. After database migrations:
```
  docker-compose up
```
4. Access the application on:
```
localhost:3000
```
5. Generate a `config/master.key` with the provided hash. This key is used on
   `Pexel API` to generate random image paths.

### Troubleshooting
1. You can start `pry` debugger attaching a docker session to container.
```
docker ps
docker attach (container_id)
```
