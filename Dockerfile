# Build
FROM golang:1.15-buster AS build
WORKDIR /go/src/github.com/wookingwoo/ip-info
COPY . .

# Must build without cgo because libc is unavailable in runtime image
ENV GO111MODULE=on CGO_ENABLED=0
RUN make

# Run
FROM scratch
EXPOSE 8080

COPY --from=build /go/bin/echoip /opt/echoip/
COPY html /opt/echoip/html

WORKDIR /opt/echoip
ENTRYPOINT ["/opt/echoip/echoip"]

# docker build --tag wookingwoo-ip-info:1.0 .