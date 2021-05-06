FROM golang:1.14.3-alpine AS build
WORKDIR /$GOPATH/src/
COPY . .
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/codeeducation
FROM scratch AS bin
COPY --from=build /go/bin/codeeducation /go/bin/codeeducation
ENTRYPOINT ["/go/bin/codeeducation"]