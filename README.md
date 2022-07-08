# test-docker
For testing purposes

## How to run

- clone the repository
- Run next commands

```bash
docker build . -t test-docker:1
docker run --rm -e NOMBRE=GNUalex -p 7080:80 test-docker:1
```

Open [http://localhost:7080](http://localhost:7080)
