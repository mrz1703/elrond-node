FROM docker:dind

RUN apk add --no-cache bash jq curl grep sed ca-certificates openssl zlib libgcc

# install docker-compose
ENV DC_VERSION=1.25.0
RUN curl -L "https://github.com/docker/compose/releases/download/${DC_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
# install glibc for docker-compose
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk && \
    apk add glibc-2.29-r0.apk && \
    rm glibc-2.29-r0.apk
# set env and check
ENV LD_LIBRARY_PATH=/lib:/usr/lib
RUN docker-compose version

# RUN addgroup -S -g 1000 elrond && \
#     adduser -S -G elrond -u 1000 elrond && \
#     addgroup elrond dockremap
# USER elrond
# ENV USER=elrond
# ENV UID=1000
# ENV GID=1000
WORKDIR /opt/Elrond
CMD ["/opt/Elrond/autoupdater.sh"]
