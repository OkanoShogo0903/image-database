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
RUN cd db && make install
#RUN cd db && make migrate/init # kesu
RUN cd db && make migrate/up

COPY --from=builder /main .

ENV PORT=${PORT}
ENTRYPOINT ["/main"]
