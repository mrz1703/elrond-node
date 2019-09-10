Instructions for starting a node:
 * Install and configure [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/)
 * `git clone https://github.com/mrz1703/elrond-node.git` - clone the repository
 * `cd elrond-node` - open the folder with the node
 * In the file `docker-compose.yml` specify the desired version for ELROND_VERSION - [nodes](https://github.com/ElrondNetwork/elrond-go) and CONFIG_VERSION - [configuration files](https://github.com/ElrondNetwork/elrond-config) (tag from github is specified)
 * `docker-compose run -w /opt/app/config elrond sh -c "keygenerator > output_keys"`- generate a new wallet (you need to execute it if it is not there, if there is then copy the files to the folder `./config/`)
 * `docker-compose run -w /opt/app/config elrond sh -c "cp /tmp/config/* /opt/app/config/"` - copy the configuration files from the temporary folder (need to be done if you do not have files configuration in the folder `. / config /`)
 * `docker-compose up -d` - run the node in daemon mode (to view the logs, use the command` docker-compose logs --tail 100 -f`).