# TeamSnap Golang Hello World

TLDR: Update `cmd/root.go` to print something different to your terminal when you run the binary!

- [Golang Tour](https://tour.golang.org/welcome/1)
- [Project layout best practices](https://github.com/golang-standards/project-layout)

## Build and Run with docker-compose

```sh
make docker_compose_start
```

### Bash into container

```sh
docker exec -it golang bash
```

### Stop docker-compose

```sh
make docker_compose_stop
```

## Build image explicitly

```sh
make docker_build
```

or...

```sh
docker build -f "$(pwd)/build/package/Dockerfile" -t go-dev:latest .
```

## Run container without docker-compose

```sh
make docker_run
```

or...

```sh
docker run -v "$(pwd)":/go/src/github.com/teamsnap/go-dev -it go-dev:latest bash
```

## Build binaries (MacOS and Linux)

From inside the container:

```sh
make build
```

Will output
- `2.0M	./go-dev.darwin`
- `1.9M	./go-dev.linux`

## Run binaries

From inside the container:

```sh
./go-dev.linux
```

From on host machine (MacOS):

```sh
./go-dev.darwin
```

### Directory Structure

```
.
├── Makefile
├── README.md
├── build
│   └── package
│       └── Dockerfile
├── cmd
│   └── root.go
├── deployments
│   └── docker-compose.yml
├── go-dev.darwin
├── go-dev.linux
└── main.go
```
