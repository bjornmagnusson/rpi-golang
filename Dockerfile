FROM resin/rpi-raspbian:jessie-20190121 as build

# Install Go
ENV GOVERSION 1.12.5
ENV GOTAR go$GOVERSION.linux-armv6l.tar.gz
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget https://storage.googleapis.com/golang/$GOTAR && \
    tar -C /usr/local -xzf $GOTAR

# Build application
RUN mkdir -p $GOPATH/src/app
WORKDIR $GOPATH/src/app
COPY . $GOPATH/src/app
