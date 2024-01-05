FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY *.go ./

RUN go build -ldflags "-w" full-cycle.go

FROM scratch

COPY --from=builder /app/full-cycle /

CMD ["/full-cycle"]