#!/bin/bash

#set -x

WORKDIR='/opt/app'
CONFIGDIR='/opt/app/config'

function iprintf {
    echo -e "\033[0;32m$(date +"%Y.%m.%d %H:%M:%S")\t$@\033[0m"
}


if [[ ! -f "${CONFIGDIR}/initialBalancesSk.pem" ]]; then
    iprintf "Not found wallet. Generate new wallet."
    cd "${CONFIGDIR}"
    keygenerator | tee output_keys
    chown 1000:1000 -R ${CONFIGDIR}
fi

# if [[ ! -f "${CONFIGDIR}/config.toml" ]]; then
#     iprintf "Configuration files not found. Copying the new configuration."
#     cp /tmp/config/* ${CONFIGDIR}/
#     chown 1000:1000 -R ${CONFIGDIR}
# fi
iprintf "Copying the new configuration."
cp /tmp/config/* ${CONFIGDIR}/

if [[ ! -z "${DISPLAY_NAME}" ]]; then
    sed -i "s|NodeDisplayName =.*|NodeDisplayName = \"${DISPLAY_NAME}\"|g" "${CONFIGDIR}/prefs.toml"
fi

#if [[ ! -z "${SHARD}" ]]; then
#    sed -i "s|DestinationShardAsObserver =.*|DestinationShardAsObserver = \"${SHARD}\"|g" "${CONFIGDIR}/config.toml"
#fi

cd "${WORKDIR}"
#head -n 20 "${CONFIGDIR}/config.toml"
iprintf "Starting node..."
exec "$@"
