# Инструкция по запуску ноды:
### Начальная настройка
 * Установить и настроить [docker](https://docs.docker.com/install/) и [docker-compose](https://docs.docker.com/compose/install/)
 * `cd /opt/`
 * `git clone https://github.com/mrz1703/elrond-node.git` - клонируем репозиторий
 * `cd elrond-node` - открываем папку с нодой
 * В файле `app/values.yml` указываем нужную версию для elrondVersion - [ноды](https://github.com/ElrondNetwork/elrond-go) и configVersion - [файлов конфигурации](https://github.com/ElrondNetwork/elrond-config) (указывается тег из github)
 * `docker-compose up -d --build` - выполняем сборку и запуск приложения


После первого запуска все файлы конфигураций и кошелек создаются автоматически (`app/data/elrond-N/config`). При необходимости после первого запуска, можно остановить ноду и выполнить замену файлов кошелька (`data/elrond-N/config/initialBalancesSk.pem` и `data/elrond-N/config/initialNodesSk.pem`).


### Команды запуска и проверки ноды
 * `docker-compose build` - собираем приложение
 * `docker-compose up -d` - запускаем ноду в режиме демона.
 * `docker-compose logs --tail 100 -f` - команда просмотра логов.
 * `docker-compose down` - останавливаем ноду.

