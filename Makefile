# ==================== [START] Global Variable Declaration =================== #
SHELL := /bin/bash
BASE_DIR := $(shell pwd)
UNAME_S := $(shell uname -s)
APP_NAME := go-dev

export
# ===================== [END] Global Variable Declaration ==================== #

# =========================== [START] git scripts ============================ #
init:
	@git config core.hooksPath githooks
# ============================ [END] git scripts ============================= #

# =========================== [START] Build Scripts ========================== #
clean:
	@rm -rf $(BASE_DIR)/vendor $(BASE_DIR)/_vendor-*

.PHONY: build
build:
	@cd $(BASE_DIR) && env GOOS=linux GOARCH=amd64 go build -o $(APP_NAME).linux
	@cd $(BASE_DIR) && env GOOS=darwin GOARCH=amd64 go build -o $(APP_NAME).darwin

docker_build:
	@docker build -f $(BASE_DIR)/build/package/Dockerfile -t teamsnap/$(APP_NAME):latest .

# ============================ [END] Build Scripts =========================== #

# ============================ [START] Run Scripts =========================== #
docker_run:
	@echo "Forwarding port 6060 for godoc usage within the container."
	@docker run --name golang -it --rm \
		-v $(BASE_DIR):/go/src/github.com/teamsnap/$(APP_NAME) \
		-p 6060:6060 \
	 teamsnap/$(APP_NAME):latest bash

docker_compose_start:
	@echo "Forwarding port 6060 for godoc usage within the container."
	@docker-compose -f $(BASE_DIR)/deployments/docker-compose.yml up -d

docker_compose_stop:
	@docker-compose -f $(BASE_DIR)/deployments/docker-compose.yml down
# ============================= [END] Run Scripts ============================ #

# ========================= [START] Formatting Script ======================== #
gofmt:
	@go fmt github.com/teamsnap/$(APP_NAME)/...

golint:
	@golint github.com/teamsnap/$(APP_NAME)/...

govet:
	@go vet github.com/teamsnap/$(APP_NAME)/...

lint: gofmt golint govet
# ========================== [END] Formatting Script ========================= #
test_by_pkg:
	@go test -v github.com/teamsnap/$(APP_NAME)

cvg:
	@go test -v -cover github.com/teamsnap/$(APP_NAME)
# ======================= [START] Documentation Scripts ====================== #
godoc:
	@godoc -http=":6060"
# ==============-========= [END] Documentation Scripts =========-============= #
