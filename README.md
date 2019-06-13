# TeamSnap Golang Hello World

TLDR: Update `cmd/root.go` to print something different to your terminal when you run the binary!

- [Golang Tour](https://tour.golang.org/welcome/1)
- [Project layout best practices](https://github.com/golang-standards/project-layout)

## Build and Run with docker-compose

```sh
make start
```

### Bash into container

```sh
docker exec -it golang bash
```

### Stop docker-compose

```sh
make stop
```

## Build image explicitly

```sh
make docker_build
```

or...

```sh
docker build -f "$(pwd)/build/package/Dockerfile" -t go-docker:latest .
```

## Run container without docker-compose

```sh
make docker_run
```

or...

```sh
docker run -v "$(pwd)":/go/src/github.com/teamsnap/go-docker -it go-docker:latest bash
```

## Build binaries (MacOS and Linux)

From inside the container:

```sh
make build
```

Will output
- `2.0M	./go-docker.darwin`
- `1.9M	./go-docker.linux`

## Run binaries

From inside the container:

```sh
./go-docker.linux
```

From on host machine (MacOS):

```sh
./go-docker.darwin
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
├── go-docker.darwin
├── go-docker.linux
└── main.go
```
