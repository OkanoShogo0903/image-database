FROM golang:alpine as builder

RUN apk update \
  && apk add --no-cache git curl make gcc g++ \
  && go get github.com/oxequa/realize

WORKDIR /app
COPY go.mod .
COPY go.sum .

RUN go mod download
COPY . .

RUN GOOS=linux GOARCH=amd64 go build -o /main cmd/api/main.go

FROM alpine:3.9

WORKDIR /app
COPY . .
RUN pwd
RUN ls
#RUN cd db && make install
RUN which goose || GO111MODULE=off go get -u github.com/pressly/goose/cmd/goose
#RUN cd db && make migrate/init # kesu
#RUN cd db && make migrate/up
RUN goose -dir migrations mysql "root:password@tcp(127.0.0.1:3306)/image_db" up

COPY --from=builder /main /main

ENV PORT=${PORT}
ENTRYPOINT ["/main"]
