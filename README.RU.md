# Инструкция по запуску ноды:
 * Установить и настроить [docker](https://docs.docker.com/install/) и [docker-compose](https://docs.docker.com/compose/install/)
 * `git clone https://github.com/mrz1703/elrond-node.git` - клонируем репозиторий
 * `cd elrond-node` - открываем папку с нодой
 * В файле `docker-compose.yml` указываем нужную версию для ELROND_VERSION - [ноды](https://github.com/ElrondNetwork/elrond-go) и CONFIG_VERSION - [файлов конфигурации](https://github.com/ElrondNetwork/elrond-config) (указывается тег из github)
 * `docker-compose run -w /opt/app/config elrond sh -c "keygenerator > output_keys"` - генерируем новый кошелек (нужно выполнить, если его нет, если есть то скопировать файлы в папку `./config/`)
 * `docker-compose run -w /opt/app/config elrond sh -c "cp /tmp/config/* /opt/app/config/"` - копируем файлы конфигурации из временной папки (нужно выполнить если у вас нет файлов конфигурации в папке `./config/`)
 * `docker-compose up -d` - запускаем ноду в режиме демона (для просмотра логов используйте команду `docker-compose logs --tail 100 -f`).