FROM alpine

RUN apk add --no-cache curl tar
RUN curl -sSL https://github.com/tsenart/vegeta/releases/download/v6.3.0/vegeta-v6.3.0-linux-amd64.tar.gz | \
      tar -xzC /usr/local/bin
