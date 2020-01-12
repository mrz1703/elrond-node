FROM golang:1.13 as build

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl bash mc git make gcc g++ build-essential

# Pull elrond-go and compile
WORKDIR /opt
ARG ELROND_VERSION
ENV GO111MODULE=on
RUN git clone -b ${ELROND_VERSION} https://github.com/ElrondNetwork/elrond-go
WORKDIR /opt/elrond-go
RUN go mod vendor
WORKDIR /opt/elrond-go/cmd/keygenerator
RUN go build
WORKDIR /opt/elrond-go/cmd/node
RUN go build -i -v -ldflags="-X main.appVersion=$(git describe --tags --long --dirty)"

# Pull elrond-config
ARG CONFIG_VERSION
WORKDIR /opt
RUN git clone https://github.com/ElrondNetwork/elrond-config && \
    cd elrond-config && \
    git checkout ${CONFIG_VERSION}

ARG WORKING_DIR_NODE
WORKDIR ${WORKING_DIR_NODE}
RUN mv /opt/elrond-config/ /tmp/config/ && \
    cp /opt/elrond-go/cmd/keygenerator/keygenerator /opt/elrond-go/cmd/node/node ${WORKING_DIR_NODE} && \
    ln -s ${WORKING_DIR_NODE}/node /usr/local/bin/ && \
    ln -s ${WORKING_DIR_NODE}/keygenerator /usr/local/bin/

COPY entrypoint.sh /
STOPSIGNAL SIGKILL
ENTRYPOINT ["/entrypoint.sh"]
CMD node \
    --use-log-view \
    --initialBalancesSkPemFile ./user_keys/initialBalancesSk.pem \
    --initialNodesSkPemFile ./user_keys/initialNodesSk.pem
