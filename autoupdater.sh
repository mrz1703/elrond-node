#!/bin/bash

set -e

function iprintf {
    echo -e "\033[0;32m$(date +"%Y.%m.%d %H:%M:%S")\t$@\033[0m" | tee -a autoupdater.log
}
function eprintf {
    echo -e "\033[0;31m$(date +"%Y.%m.%d %H:%M:%S")\t$@\033[0m" | tee -a autoupdater.log
}

USE_COMPOSE_FILE=${USE_COMPOSE_FILE:-docker-compose.yml}
RETRY_TIME_DONT_GET_TAG=${RETRY_TIME_DONT_GET_TAG:-35s}
RETRY_TIME_GET_TAG=${RETRY_TIME_DONT_GET_TAG:-5m}

GH_CREDENTIAL=${GH_CREDENTIAL}

function create_backup {
    iprintf "Create backup"
    now_time=$(date +"%Y-%m-%d_%H-%M-%S")
    mkdir -p "./backup/${now_time}"
    cp -R data/ ./backup/${now_time}/
    iprintf 'Backup done!'
}

function dc_build {
    iprintf "Build new container"
    docker-compose -f ${USE_COMPOSE_FILE} build
    iprintf "Building done!"
}

function dc_up {
    iprintf "Running new container"
    docker-compose -f ${USE_COMPOSE_FILE} up -d
    iprintf "Running done!"
}

function print_tags {
    iprintf "
Now app tag:  ${ELROND_VERSION}
Now conf tag: ${CONFIG_VERSION}
Latest app tag: ${LATEST}
Latest conf tag: ${CONFIGVER}
"
}

function while_check {
    while true; do
        source .env
        if [[ -z "${ELROND_VERSION}" || -z "${CONFIG_VERSION}" ]]; then
            eprintf "WTF??? ${ELROND_VERSION} || ${ELROND_VERSION}"
            exit 1
        fi

        LATEST="$(curl ${GH_LOGIN} --silent "https://api.github.com/repos/ElrondNetwork/elrond-go/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"
        CONFIGVER="$(curl ${GH_LOGIN} --silent "https://api.github.com/repos/ElrondNetwork/elrond-config/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"

        if [[ -z "${LATEST}" || -z "${CONFIGVER}" ]]; then
            eprintf "Couldn't get the latest tag from Github!!! Sleep ${RETRY_TIME_DONT_GET_TAG}"
            sleep ${RETRY_TIME_DONT_GET_TAG}
        elif [[ "${ELROND_VERSION}" != "${LATEST}" || "${CONFIG_VERSION}" != ${CONFIGVER} ]]; then
            print_tags
            iprintf "Start updating!"
            sed -i "s|ELROND_VERSION=.*|ELROND_VERSION=${LATEST}|g;" .env
            sed -i "s|CONFIG_VERSION=.*|CONFIG_VERSION=${CONFIGVER}|g;" .env

            create_backup
            dc_build
            dc_up

            iprintf "Updating done! Sleep ${RETRY_TIME_GET_TAG}"
            sleep ${RETRY_TIME_GET_TAG}
        else
            sleep ${RETRY_TIME_GET_TAG}
        fi
    done
}


# starting app
create_backup
dc_build
dc_up

#sleep 1m
set -x
while_check
