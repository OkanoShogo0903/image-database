FROM golang:alpine as builder

RUN apk update \
  && apk add --no-cache git curl make gcc g++ \
  && go get github.com/oxequa/realize

RUN go get github.com/cespare/reflex

WORKDIR /app
COPY go.mod .
COPY go.sum .

RUN go mod download
COPY . .

RUN GOOS=linux GOARCH=amd64 go build -o /main cmd/api/main.go

FROM alpine:3.9
COPY --from=builder /go/bin/reflex /go/bin/reflex

COPY --from=builder /main .

ENV PORT=${PORT}
ENTRYPOINT ["/main"]
