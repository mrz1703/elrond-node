# Instructions for starting a node:
### Initial setup
 * Install and configure [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/)
 * `git clone https://github.com/mrz1703/elrond-node.git` - clone the repository
 * `cd elrond-node` - open the folder with the node
 * In the file `.env` specify the desired version for ELROND_VERSION - [nodes](https://github.com/ElrondNetwork/elrond-go) and CONFIG_VERSION - [configuration files](https://github.com/ElrondNetwork/elrond-config) (tag from github is specified)
 * `docker-compose build` - build the application


After the first launch, all configuration files and a wallet are created automatically (`data/config`). If necessary, after the first start, you can stop the node and replace the wallet files (`data/config/initialBalancesSk.pem` and `data/config/initialNodesSk.pem`), as well as configure the `config.toml` (`data/config/config.toml`).


### Commands for starting and verifying a node
## If you using autoupdater
 * `docker-compose -f docker-compose.autoupdater.yml up -d` - run the autoupdater in daemon mode.
 * `docker-compose -f docker-compose.autoupdater.yml logs --tail 100 -f` - command to view logs.
 * `docker-compose -f docker-compose.autoupdater.yml down -v` - stop the autoupdater.
 * `docker-compose -f docker-compose.autoupdater.yml run docker-compose down -v` - stop all containers app elrond.


## If you dont using autoupdater
 * `docker-compose up -d` - run the multinode in daemon mode.
 * `docker-compose logs --tail 100 -f` - a command to view logs for a multinode.
 * `docker-compose down` - stop the multinode.
 * `docker-compose -f docker-compose.single.yml up -d` - run the singlenode in daemon mode.
 * `docker-compose -f docker-compose.single.yml logs --tail 100 -f` - command to view logs.
 * `docker-compose -f docker-compose.single.yml down` - stop the singlenode.

### Upgrade if you dont using autoupdater
 1) Stop your node with the command `docker-compose down` or `docker-compose -f docker-compose.single.yml down`. If remove old DB, use arg `-v`, exmpl: `docker-compose down -v`
 2) Backup your keys (`data/config/initialBalancesSk.pem` and `data/config/initialNodesSk.pem`) or (`data/<elrond-[1-6]>/config/initialBalancesSk.pem` and `data/<elrond-[1-6]>/config/initialNodesSk.pem`).
 3) Update the value of the `.env` file to the new version values and build the new container with the `docker-compose build` command.
 4) Run the node with the command `docker-compose up -d` or `docker-compose -f docker-compose.single.yml up -d`. And enjoy her work. =)

### Autoupdater
 1) Autoupdater automatically creates backups of your data in the `./backup/` folder.
 2) TODO ...
