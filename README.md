# Instructions for starting a node:
### Initial setup
 * Install and configure [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/)
 * `cd /opt/` - open folder
 * `git clone https://github.com/mrz1703/elrond-node.git` - clone the repository
 * `cd elrond-node` - open the folder with the node
 * In the file `app/values.yml` specify the desired version for elrondVersion - [nodes](https://github.com/ElrondNetwork/elrond-go) and configVersion - [configuration files](https://github.com/ElrondNetwork/elrond-config) (tag from github is specified)
 * `docker-compose up -d --build` - build and run the application


After the first launch, all configuration files and a wallet are created automatically (`data/elrond-N/config`). If necessary, after the first start, you can stop the node and replace the wallet files (`data/elrond-N/config/initialBalancesSk.pem` and `data/elrond-N/config/initialNodesSk.pem`).


Config files wallets after first run nodes: `/opt/elrond-node/app/data/elrond-N/`


### Commands for starting and verifying a node
 * `docker-compose build` - build the application
 * `docker-compose up -d` - run the multinode in daemon mode.
 * `docker-compose logs --tail 100 -f` - a command to view logs for a multinode.
 * `docker-compose down` - stop the multinode.

### If nodes dont stop (elrond-1, elrond-N...)
 * `cd app/` - open folder
 * `docker-compose down` - manualy stop nodes
 * `docker-compose down -v` - manualy stop nodes and remove old databases
