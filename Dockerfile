FROM golang:1.21.0 AS builder

WORKDIR /app

COPY *.go ./

RUN go build full-cycle.go

FROM alpine:3.14

COPY --from=builder /app/full-cycle /

CMD ["/full-cycle"]