FROM golang:alpine AS builder
WORKDIR /app
COPY go.mod ./
COPY main.go ./
RUN go build -o fullcycle

FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"]
