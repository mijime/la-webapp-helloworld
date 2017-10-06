FROM golang:alpine AS build-env

COPY . /var/app/go-webapp
WORKDIR /var/app/go-webapp
RUN go build

FROM alpine

COPY --from=build-env /var/app/go-webapp/go-webapp /usr/bin/go-webapp
CMD ["go-webapp"]
EXPOSE 5000
