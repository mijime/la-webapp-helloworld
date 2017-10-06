FROM nimlang/nim:alpine AS build-env

RUN nimble refresh
COPY . /var/app
WORKDIR /var/app
RUN nimble build

FROM alpine

RUN apk add --no-cache openssl pcre
COPY --from=build-env /var/app/nim_webapp /usr/bin/nim_webapp
CMD ["nim_webapp"]
EXPOSE 5000
