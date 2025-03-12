FROM golang:1.18.2 as build

COPY ./ /go/src/github.com/chatwork/sendgrid_exporter
WORKDIR /go/src/github.com/chatwork/sendgrid_exporter

RUN go mod download \
    #    && go test ./... \
    && CGO_ENABLED=0 GOOS=linux go build -o /bin/exporter

FROM alpine:3.15

RUN apk --no-cache add ca-certificates \
    && addgroup exporter \
    && adduser -S -G exporter exporter
USER exporter
COPY --from=build /bin/exporter /bin/exporter

ENTRYPOINT [ "/bin/exporter" ]
