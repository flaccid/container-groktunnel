FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY cmd/groktunnel/* ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /groktunnel

FROM scratch
COPY --from=builder /groktunnel /groktunnel
ENTRYPOINT ["/groktunnel"]
