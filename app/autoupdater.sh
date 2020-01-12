#!/bin/bash

set -e

RETRY_TIME_IF_ERROR_GET_TAG=${RETRY_TIME_IF_ERROR_GET_TAG:-25s}
RETRY_TIME_GET_TAG=${RETRY_TIME_GET_TAG:-4m}
GH_CREDENTIAL=${GH_CREDENTIAL}
DOCKER_TIMEOUT=${DOCKER_TIMEOUT:-20}

function iprintf {
    echo -e "\033[0;32m$(date +"%Y.%m.%d %H:%M:%S")\t$@\033[0m" #| tee -a autoupdater.log
}
function eprintf {
    echo -e "\033[0;31m$(date +"%Y.%m.%d %H:%M:%S")\t$@\033[0m" #| tee -a autoupdater.log
}
function err_report {
    echo -e "File: ${BASH_SOURCE[1]##*/} \nFunction: ${FUNCNAME[1]} \nLine: ${BASH_LINENO[0]}\n"
}
trap 'err_report $LINENO' ERR
function fn_trap {
    iprintf "Application stopped!"
    docker-compose down -t ${DOCKER_TIMEOUT}
    exit 0
}
trap 'fn_trap' SIGTERM SIGUSR1 SIGINT SIGQUIT


function gen_dockercompose {
    iprintf "Generating docker-compose.yml from template."
    jinja2 docker-compose.tpl values.yml -o docker-compose.yml
}
function dc_build {
    iprintf "Build new container"
    docker-compose build
}
function dc_down_and_clean {
    iprintf "Container down and cleaning volumes (old DB)"
    docker-compose down -v -t ${DOCKER_TIMEOUT}
}
function dc_up {
    iprintf "Running new container"
    docker-compose up -d -t ${DOCKER_TIMEOUT}
}
function print_now_tags {
    iprintf "
Now app tag:  ${ELROND_VERSION}
Now conf tag: ${CONFIG_VERSION}
"
}
function get_now_tags {
    export ELROND_VERSION="$(sed -n 's/elrondVersion: \(.*\)/\1/p' values.yml)"
    export CONFIG_VERSION="$(sed -n 's/configVersion: \(.*\)/\1/p' values.yml)"
}
function print_latest_tags {
    iprintf "
Latest app tag: ${LATEST}
Latest conf tag: ${CONFIGVER}
"
}
function update_version {
    sed -i "s|elrondVersion:.*|elrondVersion: ${LATEST}|g;
            s|configVersion:.*|configVersion: ${CONFIGVER}|g;" values.yml
}
function while_check {
    while true; do
        get_now_tags
        if [[ -z "${ELROND_VERSION}" || -z "${CONFIG_VERSION}" ]]; then
            eprintf "WTF??? ${ELROND_VERSION} || ${CONFIG_VERSION}"
            exit 1
        fi

        LATEST="$(curl ${GH_CREDENTIAL} --silent "https://api.github.com/repos/ElrondNetwork/elrond-go/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"
        CONFIGVER="$(curl ${GH_CREDENTIAL} --silent "https://api.github.com/repos/ElrondNetwork/elrond-config/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"

        if [[ -z "${LATEST}" || -z "${CONFIGVER}" ]]; then
            eprintf "Couldn't get the latest tag from Github!!! Sleep ${RETRY_TIME_IF_ERROR_GET_TAG}"
            sleep ${RETRY_TIME_IF_ERROR_GET_TAG} <&0 & wait

        elif [[ "${ELROND_VERSION}" != "${LATEST}" || "${CONFIG_VERSION}" != ${CONFIGVER} ]]; then
            iprintf "Found a new version! Start updating!"

            print_now_tags
            print_latest_tags
            update_version
            gen_dockercompose
            dc_build
            dc_down_and_clean
            sleep 10s <&0 & wait
            dc_up

            iprintf "Updating done! Sleep ${RETRY_TIME_GET_TAG}\n\n"
            sleep ${RETRY_TIME_GET_TAG} <&0 & wait
        else
            docker-compose up -d
            sleep ${RETRY_TIME_GET_TAG} <&0 & wait
        fi
    done
}


#set -x
# starting app
iprintf "Run autoupdater!"
get_now_tags
gen_dockercompose
dc_build
dc_up
print_now_tags
# run loop checks
while_check
