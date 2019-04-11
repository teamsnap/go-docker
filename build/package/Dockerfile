FROM golang:1.12.2-alpine3.9

ENV \
 GOPATH="/go" \
 GOBIN="/go/bin" \
 GOARCH="amd64" \
 PATH="$PATH:/go/bin" \
 TEMP_DL_DIR="/tmp/downloads" \
 GO_DEP_INSTALL_SCRIPT="https://raw.githubusercontent.com/golang/dep/master/install.sh"

# Install golang and dep
# Find versions and DL links here: https://golang.org/dl/
# might need - build-base
# might need - gcc
RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    git \
    make \
 && mkdir -p "${GOBIN}" "${TEMP_DL_DIR}" \
 && go version \
 && curl "${GO_DEP_INSTALL_SCRIPT}" \
     --output "${TEMP_DL_DIR}/install-dep.sh" \
     --silent \
 && chmod a+x "${TEMP_DL_DIR}/install-dep.sh" \
 && cat "${TEMP_DL_DIR}/install-dep.sh" \
 && "${TEMP_DL_DIR}/install-dep.sh" \
 && rm "${TEMP_DL_DIR}/install-dep.sh" \
 && go get -u golang.org/x/lint/golint

WORKDIR /go/src/github.com/teamsnap/go-dev

CMD bash
