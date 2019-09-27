# Инструкция по запуску ноды:
### Начальная настройка
 * Установить и настроить [docker](https://docs.docker.com/install/) и [docker-compose](https://docs.docker.com/compose/install/)
 * `git clone https://github.com/mrz1703/elrond-node.git` - клонируем репозиторий
 * `cd elrond-node` - открываем папку с нодой
 * В файле `.env` указываем нужную версию для ELROND_VERSION - [ноды](https://github.com/ElrondNetwork/elrond-go) и CONFIG_VERSION - [файлов конфигурации](https://github.com/ElrondNetwork/elrond-config) (указывается тег из github)
 * `docker-compose build` - выполняем сборку приложения


После первого запуска все файлы конфигураций и кошелек создаются автоматически (`data/config`). При необходимости после первого запуска, можно остановить ноду и выполнить замену файлов кошелька (`data/config/initialBalancesSk.pem` и `data/config/initialNodesSk.pem`), а так же настроить должным образом файл `config.toml` (`data/config/config.toml`).


### Команды запуска и проверки ноды
 * `docker-compose up -d` - запускаем ноду в режиме демона.
 * `docker-compose logs --tail 100 -f` - команда просмотра логов.
 * `docker-compose down` - останавливаем ноду.
 * `docker-compose -f docker-compose.multiple.yml up -d` - запускаем мультиноду в режиме демона .
 * `docker-compose -f docker-compose.multiple.yml logs --tail 100 -f` - команда просмотра логов для мультиноды.
 * `docker-compose -f docker-compose.multiple.yml down` - останавливаем мультиноду.

### Обновление
 1) Остановите вашу ноду командой `docker-compose down` или `docker-compose -f docker-compose.multiple.yml down`.
 2) Скопируйте ваши ключи (`data/config/initialBalancesSk.pem` и `data/config/initialNodesSk.pem`) в надежное место и удалите папку `data`.
 3) Обновите значение файла `.env` на новые значения версии и выполните сборку нового контейнера командой `docker-compose build`.
 4) Запускаем ноду командой `docker-compose up -d` или `docker-compose -f docker-compose.multiple.yml up -d`.
 5) Останавливаем ноду командой `docker-compose down` или `docker-compose -f docker-compose.multiple.yml down`. Копируем ключи кошелька (`initialBalancesSk.pem` и `initialNodesSk.pem`) из надежного места в папку `./data/config/`.
 6) Запускаем ноду командой `docker-compose up -d` или `docker-compose -f docker-compose.multiple.yml up -d`. И наслаждаемся ее работой.