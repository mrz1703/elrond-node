FROM golang:1.13-alpine as build

RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl bash mc git make gcc g++ linux-headers libgcc libstdc++


WORKDIR /opt
ARG ELROND_VERSION
RUN git clone -b ${ELROND_VERSION} https://github.com/ElrondNetwork/elrond-go
RUN cd ./elrond-go && \
    GO111MODULE=on go mod vendor && \
    cd cmd/keygenerator && \
    go build && \
    cd ../node && \
    go build -i -v -ldflags="-X main.appVersion=$(git describe --tags --long --dirty)"

ARG CONFIG_VERSION
WORKDIR /opt
RUN git clone -b ${CONFIG_VERSION} https://github.com/ElrondNetwork/elrond-config


FROM alpine
WORKDIR /opt/app
COPY --from=build /opt/elrond-config/ /tmp/config/
COPY --from=build /opt/elrond-go/cmd/keygenerator/keygenerator /opt/elrond-go/cmd/node/node /opt/app/
RUN ln -s /opt/app/node /usr/local/bin/ && \
    ln -s /opt/app/keygenerator /usr/local/bin/
CMD node --use-log-view
