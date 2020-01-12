#!/bin/bash

#set -x

workdir=${WORKING_DIR_NODE}
configdir="${workdir}/config"
keysdir="${workdir}/user_keys"

function iprintf {
    echo -e "\033[0;32m$(date +"%Y.%m.%d %H:%M:%S")\t$@\033[0m"
}
function fn_trap {
    iprintf "Application stopped!"
    exit 0
}
trap 'fn_trap' SIGTERM SIGUSR1 SIGINT SIGQUIT


mkdir -p ${workdir} ${configdir} ${keysdir}
if [[ ! -f "${keysdir}/initialBalancesSk.pem" || ! -f "${keysdir}/initialNodesSk.pem" ]]; then
    iprintf "Not found wallet. Generate new wallet."
    pushd "${keysdir}"
    keygenerator | tee output_keys
    chown 1000:1000 -R ${keysdir}
    popd
fi

iprintf "Copying configuration."
cp /tmp/config/* ${configdir}/

if [[ ! -z "${DISPLAY_NAME}" ]]; then
    sed -i "s|NodeDisplayName =.*|NodeDisplayName = \"${DISPLAY_NAME}\"|g" "${configdir}/prefs.toml"
fi

#if [[ ! -z "${SHARD}" ]]; then
#    sed -i "s|DestinationShardAsObserver =.*|DestinationShardAsObserver = \"${SHARD}\"|g" "${configdir}/config.toml"
#fi

iprintf "Starting node..."
exec "$@"
