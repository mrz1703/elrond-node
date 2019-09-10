# Example step-by-step

```
mrz1703@zero:~$ cd /tmp/
mrz1703@zero:/tmp$ 
mrz1703@zero:/tmp$ git clone https://github.com/mrz1703/elrond-node.git
Клонирование в «elrond-node»…
remote: Enumerating objects: 18, done.
remote: Counting objects: 100% (18/18), done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 18 (delta 5), reused 17 (delta 4), pack-reused 0
Распаковка объектов: 100% (18/18), готово.
mrz1703@zero:/tmp$ 
mrz1703@zero:/tmp$ cd elrond-node/
mrz1703@zero:/tmp/elrond-node$ 
mrz1703@zero:/tmp/elrond-node$ ls -la
итого 32
drwxr-xr-x  4 rudko rudko 4096 сен 10 19:42 .
drwxrwxrwt 21 root  root  4096 сен 10 19:42 ..
drwxr-xr-x  2 rudko rudko 4096 сен 10 19:42 .build
-rw-r--r--  1 rudko rudko  389 сен 10 19:42 docker-compose.yml
drwxr-xr-x  8 rudko rudko 4096 сен 10 19:42 .git
-rw-r--r--  1 rudko rudko    8 сен 10 19:42 .gitignore
-rw-r--r--  1 rudko rudko 1178 сен 10 19:42 README.md
-rw-r--r--  1 rudko rudko 1543 сен 10 19:42 README.RU.md
mrz1703@zero:/tmp/elrond-node$ 
mrz1703@zero:/tmp/elrond-node$ cat docker-compose.yml 
version: '3.7'
services:

  elrond:
    container_name: elrond
    restart: always
    volumes:
      - ./config/:/opt/app/config/
      - ./db/:/opt/app/db/
      - ./logs/:/opt/app/logs/
      - ./stats/:/opt/app/stats/
    ports:
      - '8080:8080'
      - '38303:38303'
    build:
      context: .build
      args:
        ELROND_VERSION: v1.0.15
        CONFIG_VERSION: testnet-1012
mrz1703@zero:/tmp/elrond-node$ 
mrz1703@zero:/tmp/elrond-node$ docker-compose build
Building elrond
Step 1/15 : FROM golang:1.12-alpine as build
 ---> e0d646523991
Step 2/15 : RUN apk update &&     apk upgrade &&     apk add --no-cache curl bash mc git make gcc g++ linux-headers libgcc libstdc++
 ---> Running in 078ffe85f7df
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/APKINDEX.tar.gz
v3.10.2-41-g6252c54e4f [http://dl-cdn.alpinelinux.org/alpine/v3.10/main]
v3.10.2-38-g39a872f50f [http://dl-cdn.alpinelinux.org/alpine/v3.10/community]
OK: 10334 distinct packages available
OK: 6 MiB in 15 packages
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/APKINDEX.tar.gz
(1/35) Installing ncurses-terminfo-base (6.1_p20190518-r0)
(2/35) Installing ncurses-terminfo (6.1_p20190518-r0)
(3/35) Installing ncurses-libs (6.1_p20190518-r0)
(4/35) Installing readline (8.0.0-r0)
(5/35) Installing bash (5.0.0-r0)
Executing bash-5.0.0-r0.post-install
(6/35) Installing nghttp2-libs (1.39.2-r0)
(7/35) Installing libcurl (7.65.1-r0)
(8/35) Installing curl (7.65.1-r0)
(9/35) Installing libgcc (8.3.0-r0)
(10/35) Installing libstdc++ (8.3.0-r0)
(11/35) Installing binutils (2.32-r0)
(12/35) Installing gmp (6.1.2-r1)
(13/35) Installing isl (0.18-r0)
(14/35) Installing libgomp (8.3.0-r0)
(15/35) Installing libatomic (8.3.0-r0)
(16/35) Installing mpfr3 (3.1.5-r1)
(17/35) Installing mpc1 (1.1.0-r0)
(18/35) Installing gcc (8.3.0-r0)
(19/35) Installing musl-dev (1.1.22-r3)
(20/35) Installing libc-dev (0.7.1-r0)
(21/35) Installing g++ (8.3.0-r0)
(22/35) Installing expat (2.2.7-r0)
(23/35) Installing pcre2 (10.33-r0)
(24/35) Installing git (2.22.0-r0)
(25/35) Installing linux-headers (4.19.36-r0)
(26/35) Installing make (4.2.1-r2)
(27/35) Installing libffi (3.2.1-r6)
(28/35) Installing libintl (0.19.8.1-r4)
(29/35) Installing libuuid (2.33.2-r0)
(30/35) Installing libblkid (2.33.2-r0)
(31/35) Installing libmount (2.33.2-r0)
(32/35) Installing pcre (8.43-r0)
(33/35) Installing glib (2.60.4-r0)
(34/35) Installing libssh2 (1.8.2-r1)
(35/35) Installing mc (4.8.22-r0)
Executing busybox-1.30.1-r2.trigger
OK: 196 MiB in 50 packages
Removing intermediate container 078ffe85f7df
 ---> f250176bf825
Step 3/15 : WORKDIR /opt
 ---> Running in 1d25ad492317
Removing intermediate container 1d25ad492317
 ---> bc58e13286cd
Step 4/15 : ARG ELROND_VERSION
 ---> Running in 831d7dbdb35d
Removing intermediate container 831d7dbdb35d
 ---> 8e15fcb086f6
Step 5/15 : RUN git clone -b ${ELROND_VERSION} https://github.com/ElrondNetwork/elrond-go
 ---> Running in 203413628c9c
Cloning into 'elrond-go'...
Note: checking out '04ca422d8b6dc407aca9d752a9fe54312a7af0c7'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

Removing intermediate container 203413628c9c
 ---> 06ffd5129afa
Step 6/15 : RUN cd ./elrond-go &&     GO111MODULE=on go mod vendor &&     cd cmd/keygenerator &&     go build &&     cd ../node &&     go build -i -v -ldflags="-X main.appVersion=$(git describe --tags --long --dirty)"
 ---> Running in 45baef7d4a63
go: finding github.com/ElrondNetwork/concurrent-map v0.1.2
go: finding github.com/ElrondNetwork/elrond-vm-common v0.0.6
go: finding github.com/glycerine/goconvey v0.0.0-20190410193231-58a59202ab31
go: finding github.com/glycerine/go-capnproto v0.0.0-20190118050403-2d07de3aa7fc
go: finding github.com/multiformats/go-multiaddr v0.0.4
go: finding github.com/gin-contrib/cors v0.0.0-20190301062745-f9e10995c85a
go: finding github.com/gizak/termui/v3 v3.1.0
go: finding github.com/pkg/profile v1.3.0
go: finding github.com/cornelk/hashmap v1.0.1-0.20190121140111-33e58823eb9d
go: finding github.com/prometheus/client_golang v1.0.0
go: finding github.com/libp2p/go-libp2p-core v0.0.3
go: finding github.com/libp2p/go-libp2p-pubsub v0.1.0
go: finding github.com/gogo/protobuf v1.2.1
go: finding github.com/360EntSecGroup-Skylar/excelize v1.4.1
go: finding github.com/davecgh/go-spew v1.1.1
go: finding github.com/ElrondNetwork/elrond-vm v0.0.15
go: finding github.com/pelletier/go-toml v1.2.0
go: finding github.com/beorn7/perks v1.0.0
go: finding gopkg.in/yaml.v2 v2.2.2
go: finding github.com/btcsuite/btcd v0.0.0-20190523000118-16327141da8c
go: finding github.com/golang/protobuf v1.2.0
go: finding github.com/syndtr/goleveldb v1.0.1-0.20190318030020-c3a204f8e965
go: finding github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90
go: finding github.com/libp2p/go-libp2p-blankhost v0.1.1
go: finding github.com/coreos/go-semver v0.3.0
go: finding github.com/multiformats/go-multistream v0.1.0
go: finding github.com/boltdb/bolt v1.3.1
go: finding github.com/gopherjs/gopherjs v0.0.0-20190430165422-3e4dfb77656c
go: finding github.com/gin-gonic/gin v1.3.0
go: finding github.com/ipfs/go-cid v0.0.2
go: finding github.com/google/gops v0.3.6
go: finding golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4
go: finding golang.org/x/sys v0.0.0-20190531073156-46560c3f3c0a
go: finding github.com/spacemonkeygo/openssl v0.0.0-20181017203307-c2dcc5cca94a
go: finding github.com/ipfs/go-log v0.0.1
go: finding github.com/shirou/gopsutil v0.0.0-20190731134726-d80c43f9c984
go: finding github.com/jtolds/gls v4.20.0+incompatible
go: finding gopkg.in/go-playground/validator.v8 v8.18.2
go: finding github.com/onsi/ginkgo v1.7.0
go: finding golang.org/x/sync v0.0.0-20181108010431-42b317875d0f
go: finding github.com/mr-tron/base58 v1.1.2
go: finding github.com/satori/go.uuid v1.2.0
go: finding go.dedis.ch/kyber/v3 v3.0.2
go: finding github.com/multiformats/go-multiaddr v0.0.2
go: finding github.com/onsi/gomega v1.4.3
go: finding golang.org/x/net v0.0.0-20190227160552-c95aed5357e7
go: finding github.com/shirou/w32 v0.0.0-20160930032740-bb4de0191aa4
go: finding github.com/shirou/gopsutil v0.0.0-20180427012116-c95755e4bcd7
go: finding github.com/libp2p/go-flow-metrics v0.0.1
go: finding github.com/sirupsen/logrus v1.4.0
go: finding github.com/libp2p/go-libp2p-swarm v0.1.0
go: finding github.com/multiformats/go-multihash v0.0.5
go: finding github.com/stretchr/testify v1.2.3-0.20181224173747-660f15d67dbb
go: finding github.com/libp2p/go-libp2p v0.1.0
go: finding github.com/multiformats/go-multibase v0.0.1
go: finding gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405
go: finding gopkg.in/yaml.v2 v2.2.1
go: finding github.com/libp2p/go-libp2p-kad-dht v0.1.0
go: finding github.com/json-iterator/go v1.1.5
go: finding github.com/xlab/treeprint v0.0.0-20180616005107-d6fb6747feb6
go: finding golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5
go: finding golang.org/x/sys v0.0.0-20171017063910-8dbc5d05d6ed
go: finding github.com/stretchr/testify v1.3.0
go: finding github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826
go: finding github.com/libp2p/go-libp2p-discovery v0.1.0
go: finding github.com/elastic/go-elasticsearch/v7 v7.1.0
go: finding github.com/whyrusleeping/go-logging v0.0.0-20170515211332-0457bb6b88fc
go: finding github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0
go: finding github.com/btcsuite/websocket v0.0.0-20150119174127-31079b680792
go: finding github.com/libp2p/go-libp2p-peerstore v0.1.0
go: finding github.com/hpcloud/tail v1.0.0
go: finding github.com/libp2p/go-libp2p-yamux v0.2.0
go: finding go.opencensus.io v0.21.0
go: finding github.com/kkdai/bstream v0.0.0-20161212061736-f391b8402d23
go: finding github.com/whyrusleeping/timecache v0.0.0-20160911033111-cfcb2f1abfee
go: finding github.com/libp2p/go-libp2p-circuit v0.1.0
go: finding github.com/hashicorp/golang-lru v0.5.1
go: finding github.com/libp2p/go-libp2p-loggables v0.1.0
go: finding github.com/whyrusleeping/multiaddr-filter v0.0.0-20160516205228-e903e4adabd7
go: finding github.com/jbenet/go-cienv v0.1.0
go: finding github.com/btcsuite/snappy-go v0.0.0-20151229074030-0bdef8d06723
go: finding golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f
go: finding github.com/jbenet/goprocess v0.1.3
go: finding golang.org/x/xerrors v0.0.0-20190513163551-3ee3066db522
go: finding github.com/libp2p/go-libp2p-testing v0.0.3
go: finding github.com/mitchellh/go-wordwrap v0.0.0-20150314170334-ad45545899c7
go: finding github.com/ipfs/go-datastore v0.0.5
go: finding github.com/libp2p/go-buffer-pool v0.0.1
go: finding github.com/StackExchange/wmi v0.0.0-20170410192909-ea383cf3ba6e
go: finding github.com/minio/sha256-simd v0.0.0-20190328051042-05b4dd3047e5
go: finding github.com/davecgh/go-spew v0.0.0-20171005155431-ecdeabc65495
go: finding github.com/mattn/go-colorable v0.1.1
go: finding github.com/glycerine/rbtree v0.0.0-20180524195614-80eebfe947f7
go: finding github.com/libp2p/go-tcp-transport v0.1.0
go: finding github.com/miekg/dns v1.1.12
go: finding gopkg.in/go-playground/assert.v1 v1.2.1
go: finding github.com/ipfs/go-ds-leveldb v0.0.1
go: finding github.com/jrick/logrotate v1.0.0
go: finding github.com/whyrusleeping/go-keyspace v0.0.0-20160322163242-5b898ac5add1
go: finding github.com/ugorji/go/codec v0.0.0-20181209151446-772ced7fd4c2
go: finding github.com/stretchr/objx v0.1.1
go: finding github.com/libp2p/go-libp2p-crypto v0.1.0
go: finding golang.org/x/text v0.3.0
go: finding github.com/multiformats/go-multiaddr-dns v0.0.2
go: finding github.com/pkg/errors v0.8.1
go: finding github.com/onsi/ginkgo v1.6.0
go: finding github.com/mattn/go-isatty v0.0.4
go: finding github.com/ipfs/go-datastore v0.0.1
go: finding github.com/multiformats/go-base32 v0.0.3
go: finding github.com/ElrondNetwork/elrond-vm-common v0.0.5
go: finding github.com/libp2p/go-maddr-filter v0.0.4
go: finding github.com/modern-go/reflect2 v1.0.1
go: finding github.com/multiformats/go-multiaddr-fmt v0.0.1
go: finding github.com/multiformats/go-multiaddr-net v0.0.1
go: finding github.com/go-check/check v0.0.0-20180628173108-788fd7840127
go: finding github.com/mattn/go-runewidth v0.0.2
go: finding github.com/davecgh/go-spew v1.1.0
go: finding github.com/libp2p/go-ws-transport v0.1.0
go: finding github.com/google/go-cmp v0.2.0
go: finding github.com/ipfs/go-todocounter v0.0.1
go: finding github.com/konsorten/go-windows-terminal-sequences v1.0.1
go: finding golang.org/x/net v0.0.0-20190311183353-d8887717615a
go: finding github.com/opentracing/opentracing-go v1.0.2
go: finding github.com/mattn/go-isatty v0.0.5
go: finding github.com/libp2p/go-reuseport-transport v0.0.2
go: finding github.com/gin-contrib/pprof v1.2.0
go: finding github.com/multiformats/go-multiaddr-dns v0.0.1
go: finding github.com/golang/protobuf v1.3.1
go: finding github.com/ipfs/go-ds-badger v0.0.2
go: finding golang.org/x/crypto v0.0.0-20190123085648-057139ce5d2b
go: finding github.com/libp2p/go-buffer-pool v0.0.2
go: finding github.com/whyrusleeping/mdns v0.0.0-20180901202407-ef14215e6b30
go: finding github.com/gorilla/websocket v1.4.0
go: finding github.com/kr/pretty v0.1.0
go: finding github.com/libp2p/go-libp2p-autonat v0.1.0
go: finding github.com/libp2p/go-libp2p-peer v0.2.0
go: finding go.dedis.ch/protobuf v1.0.5
go: finding github.com/libp2p/go-libp2p-mplex v0.2.1
go: finding golang.org/x/sys v0.0.0-20181228144115-9a3f9b0469bb
go: finding golang.org/x/crypto v0.0.0-20180904163835-0709b304e793
go: finding golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223
go: finding github.com/keybase/go-ps v0.0.0-20161005175911-668c8856d999
go: finding github.com/libp2p/go-yamux v1.2.2
go: finding github.com/dgryski/go-farm v0.0.0-20190104051053-3adb47b1fb0f
go: finding github.com/Kubuxu/go-os-helper v0.0.1
go: finding github.com/libp2p/go-libp2p-nat v0.0.4
go: finding github.com/StackExchange/wmi v0.0.0-20180116203802-5d049714c4a6
go: finding github.com/multiformats/go-multiaddr v0.0.1
go: finding golang.org/x/sys v0.0.0-20190124100055-b90733256f2e
go: finding github.com/jbenet/goprocess v0.0.0-20160826012719-b497e2f366b8
go: finding golang.org/x/net v0.0.0-20181220203305-927f97764cc3
go: finding github.com/mr-tron/base58 v1.1.0
go: finding github.com/hashicorp/golang-lru v0.5.0
go: finding github.com/kardianos/osext v0.0.0-20170510131534-ae77be60afb1
go: finding github.com/jessevdk/go-flags v0.0.0-20141203071132-1679536dcc89
go: finding github.com/json-iterator/go v1.1.6
go: finding github.com/fsnotify/fsnotify v1.4.7
go: finding github.com/gin-contrib/sse v0.0.0-20170109093832-22d885f9ecc7
go: finding golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2
go: finding github.com/prometheus/common v0.4.1
go: finding github.com/dchest/siphash v1.1.0
go: finding github.com/google/uuid v1.1.1
go: finding github.com/libp2p/go-mplex v0.1.0
go: finding golang.org/x/crypto v0.0.0-20190426145343-a29dc8fdc734
go: finding github.com/btcsuite/go-socks v0.0.0-20170105172521-4720035b7bfd
go: finding github.com/libp2p/go-libp2p-core v0.0.1
go: finding github.com/syndtr/goleveldb v1.0.0
go: finding github.com/libp2p/go-libp2p-routing v0.1.0
go: finding github.com/stretchr/objx v0.1.0
go: finding github.com/aead/siphash v1.0.1
go: finding gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127
go: finding github.com/prometheus/procfs v0.0.2
go: finding github.com/golang/snappy v0.0.1
go: finding github.com/libp2p/go-libp2p-mplex v0.2.0
go: finding github.com/libp2p/go-addr-util v0.0.1
go: finding github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf
go: finding github.com/libp2p/go-libp2p-transport-upgrader v0.1.1
go: finding rsc.io/goversion v1.0.0
go: finding github.com/golang/protobuf v1.3.0
go: finding github.com/whyrusleeping/go-notifier v0.0.0-20170827234753-097c5d47330f
go: finding gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7
go: finding github.com/jbenet/go-cienv v0.0.0-20150120210510-1bb1476777ec
go: finding github.com/btcsuite/btclog v0.0.0-20170628155309-84c8d2346e9f
go: finding github.com/pkg/errors v0.8.0
go: finding github.com/julienschmidt/httprouter v1.2.0
go: finding github.com/ipfs/go-ipfs-delay v0.0.0-20181109222059-70721b86a9a8
go: finding github.com/spacemonkeygo/spacelog v0.0.0-20180420211403-2296661a0572
go: finding golang.org/x/sys v0.0.0-20190412213103-97732733099d
go: finding github.com/kisielk/errcheck v1.1.0
go: finding github.com/dustin/go-humanize v1.0.0
go: finding github.com/pmezard/go-difflib v1.0.0
go: finding github.com/btcsuite/winsvc v1.0.0
go: finding github.com/stretchr/testify v1.2.2
go: finding github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
go: finding github.com/minio/blake2b-simd v0.0.0-20160723061019-3f5f724cb5b1
go: finding github.com/kr/text v0.1.0
go: finding github.com/mr-tron/base58 v1.1.1
go: finding github.com/minio/sha256-simd v0.0.0-20190131020904-2d45a736cd16
go: finding github.com/spaolacci/murmur3 v1.1.0
go: finding github.com/ipfs/go-ipfs-util v0.0.1
go: finding github.com/AndreasBriese/bbloom v0.0.0-20180913140656-343706a395b7
go: finding github.com/multiformats/go-multihash v0.0.1
go: finding golang.org/x/crypto v0.0.0-20190225124518-7f87c0fbb88b
go: finding golang.org/x/crypto v0.0.0-20170930174604-9419663f5a44
go: finding github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc
go: finding github.com/beevik/ntp v0.2.0
go: finding github.com/matttproud/golang_protobuf_extensions v1.0.1
go: finding github.com/minio/sha256-simd v0.1.0
go: finding golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a
go: finding github.com/go-stack/stack v1.8.0
go: finding github.com/libp2p/go-conn-security-multistream v0.1.0
go: finding gopkg.in/fsnotify.v1 v1.4.7
go: finding github.com/btcsuite/goleveldb v0.0.0-20160330041536-7834afc9e8cd
go: finding github.com/libp2p/go-reuseport v0.0.1
go: finding golang.org/x/crypto v0.0.0-20190530122614-20be4c3c3ed5
go: finding github.com/onsi/gomega v1.5.0
go: finding github.com/go-ole/go-ole v1.2.1
go: finding github.com/sirupsen/logrus v1.2.0
go: finding github.com/libp2p/go-libp2p-secio v0.1.0
go: finding golang.org/x/tools v0.0.0-20180221164845-07fd8470d635
go: finding github.com/btcsuite/btcutil v0.0.0-20190425235716-9e5f4b9a998d
go: finding github.com/libp2p/go-nat v0.0.3
go: finding gopkg.in/alecthomas/kingpin.v2 v2.2.6
go: finding github.com/urfave/cli v1.20.0
go: finding github.com/gxed/hashland/keccakpg v0.0.1
go: finding github.com/onsi/ginkgo v1.8.0
go: finding github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973
go: finding github.com/prometheus/client_golang v0.9.1
go: finding github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d
go: finding github.com/gxed/hashland/murmur3 v0.0.1
go: finding github.com/jbenet/go-temp-err-catcher v0.0.0-20150120210811-aac704a3f4f2
go: finding golang.org/x/crypto v0.0.0-20190211182817-74369b46fc67
go: finding github.com/ipfs/go-detect-race v0.0.1
go: finding github.com/btcsuite/btcd v0.0.0-20190213025234-306aecffea32
go: finding github.com/golang/snappy v0.0.0-20180518054509-2e65f85255db
go: finding golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e
go: finding github.com/libp2p/go-msgio v0.0.2
go: finding google.golang.org/genproto v0.0.0-20180831171423-11092d34479b
go: finding golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3
go: finding github.com/kr/pty v1.1.1
go: finding golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33
go: finding github.com/koron/go-ssdp v0.0.0-20180514024734-4a0ed625a78b
go: finding github.com/btcsuite/btcutil v0.0.0-20190207003914-4c204d697803
go: finding golang.org/x/sys v0.0.0-20190219092855-153ac476189d
go: finding github.com/ipfs/go-cid v0.0.1
go: finding github.com/go-logfmt/logfmt v0.3.0
go: finding github.com/libp2p/go-libp2p-record v0.1.0
go: finding golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5
go: finding github.com/gogo/protobuf v1.1.1
go: finding github.com/jackpal/gateway v1.0.5
go: finding github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910
go: finding github.com/kisielk/gotool v1.0.0
go: finding golang.org/x/sys v0.0.0-20181221143128-b4a75ba826a6
go: finding google.golang.org/genproto v0.0.0-20190307195333-5fe7a883aa19
go: finding github.com/dgraph-io/badger v1.5.5-0.20190226225317-8115aed38f8f
go: finding go.dedis.ch/fixbuf v1.0.3
go: finding github.com/libp2p/go-mplex v0.0.3
go: finding github.com/huin/goupnp v1.0.0
go: finding golang.org/x/sys v0.0.0-20190228124157-a34e9553db1e
go: finding github.com/libp2p/go-libp2p-netutil v0.1.0
go: finding golang.org/x/net v0.0.0-20181114220301-adae6a3d119a
go: finding github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223
go: finding github.com/libp2p/go-libp2p-testing v0.0.2
go: finding github.com/libp2p/go-stream-muxer-multistream v0.2.0
go: finding golang.org/x/crypto v0.0.0-20190513172903-22d7a77e9e5f
go: finding github.com/libp2p/go-libp2p-kbucket v0.2.0
go: finding github.com/nsf/termbox-go v0.0.0-20190121233118-02980233997d
go: finding google.golang.org/grpc v1.19.0
go: finding golang.org/x/net v0.0.0-20180906233101-161cd47e91fd
go: finding github.com/whyrusleeping/mafmt v1.2.8
go: finding github.com/jackpal/go-nat-pmp v1.0.1
go: finding github.com/huin/goutil v0.0.0-20170803182201-1ca381bf3150
go: finding github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515
go: finding github.com/whyrusleeping/base32 v0.0.0-20170828182744-c30ac30633cc
go: finding github.com/go-kit/kit v0.8.0
go: finding golang.org/x/net v0.0.0-20181011144130-49bb7cea24b1
go: finding github.com/libp2p/go-stream-muxer v0.0.1
go: finding golang.org/x/net v0.0.0-20180826012351-8a410e7b638d
go: finding golang.org/x/sys v0.0.0-20180830151530-49385e6e1522
go: finding github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
go: finding golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3
go: finding golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be
go: finding google.golang.org/appengine v1.1.0
go: finding google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8
go: finding honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099
go: finding cloud.google.com/go v0.26.0
go: finding github.com/BurntSushi/toml v0.3.1
go: finding github.com/golang/mock v1.1.1
go: finding golang.org/x/tools v0.0.0-20190114222345-bf090417da8b
go: finding github.com/client9/misspell v0.3.4
go: finding golang.org/x/tools v0.0.0-20190226205152-f727befe758c
go: finding golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961
go: finding golang.org/x/net v0.0.0-20190213061140-3a22650c66bd
go: finding golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6
go: finding google.golang.org/appengine v1.4.0
go: finding golang.org/x/exp v0.0.0-20190121172915-509febef88a4
go: finding golang.org/x/net v0.0.0-20180724234803-3673e40ba225
go: downloading go.dedis.ch/kyber/v3 v3.0.2
go: downloading github.com/pkg/errors v0.8.1
go: downloading github.com/pelletier/go-toml v1.2.0
go: downloading github.com/prometheus/client_golang v1.0.0
go: downloading github.com/ipfs/go-log v0.0.1
go: downloading github.com/libp2p/go-libp2p-core v0.0.3
go: downloading github.com/ElrondNetwork/elrond-vm v0.0.15
go: downloading github.com/sirupsen/logrus v1.4.0
go: extracting github.com/ipfs/go-log v0.0.1
go: extracting github.com/pkg/errors v0.8.1
go: downloading github.com/gin-gonic/gin v1.3.0
go: downloading github.com/mr-tron/base58 v1.1.2
go: extracting github.com/libp2p/go-libp2p-core v0.0.3
go: extracting github.com/pelletier/go-toml v1.2.0
go: downloading github.com/gizak/termui/v3 v3.1.0
go: extracting github.com/mr-tron/base58 v1.1.2
go: downloading github.com/multiformats/go-multiaddr v0.0.4
go: downloading github.com/libp2p/go-libp2p-kad-dht v0.1.0
go: extracting github.com/sirupsen/logrus v1.4.0
go: downloading github.com/golang/protobuf v1.3.1
go: extracting github.com/prometheus/client_golang v1.0.0
go: extracting github.com/gizak/termui/v3 v3.1.0
go: extracting github.com/multiformats/go-multiaddr v0.0.4
go: downloading github.com/konsorten/go-windows-terminal-sequences v1.0.1
go: downloading github.com/shirou/gopsutil v0.0.0-20190731134726-d80c43f9c984
go: extracting github.com/konsorten/go-windows-terminal-sequences v1.0.1
go: downloading github.com/cornelk/hashmap v1.0.1-0.20190121140111-33e58823eb9d
go: downloading golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5
go: extracting github.com/cornelk/hashmap v1.0.1-0.20190121140111-33e58823eb9d
go: downloading golang.org/x/sys v0.0.0-20190531073156-46560c3f3c0a
go: extracting github.com/libp2p/go-libp2p-kad-dht v0.1.0
go: extracting github.com/gin-gonic/gin v1.3.0
go: downloading github.com/opentracing/opentracing-go v1.0.2
go: extracting go.dedis.ch/kyber/v3 v3.0.2
go: downloading github.com/whyrusleeping/timecache v0.0.0-20160911033111-cfcb2f1abfee
go: downloading github.com/dchest/siphash v1.1.0
go: downloading github.com/btcsuite/btcd v0.0.0-20190523000118-16327141da8c
go: extracting github.com/whyrusleeping/timecache v0.0.0-20160911033111-cfcb2f1abfee
go: extracting github.com/opentracing/opentracing-go v1.0.2
go: downloading github.com/libp2p/go-libp2p-record v0.1.0
go: downloading github.com/mattn/go-isatty v0.0.5
go: extracting github.com/libp2p/go-libp2p-record v0.1.0
go: downloading github.com/dgraph-io/badger v1.5.5-0.20190226225317-8115aed38f8f
go: extracting github.com/dchest/siphash v1.1.0
go: extracting github.com/mattn/go-isatty v0.0.5
go: downloading github.com/ipfs/go-ipfs-util v0.0.1
go: downloading go.opencensus.io v0.21.0
go: extracting github.com/shirou/gopsutil v0.0.0-20190731134726-d80c43f9c984
go: extracting github.com/ipfs/go-ipfs-util v0.0.1
go: downloading github.com/libp2p/go-libp2p-kbucket v0.2.0
go: downloading github.com/json-iterator/go v1.1.6
go: extracting github.com/golang/protobuf v1.3.1
go: extracting github.com/libp2p/go-libp2p-kbucket v0.2.0
go: downloading github.com/elastic/go-elasticsearch/v7 v7.1.0
go: downloading github.com/StackExchange/wmi v0.0.0-20180116203802-5d049714c4a6
go: extracting github.com/dgraph-io/badger v1.5.5-0.20190226225317-8115aed38f8f
go: downloading golang.org/x/xerrors v0.0.0-20190513163551-3ee3066db522
go: extracting github.com/StackExchange/wmi v0.0.0-20180116203802-5d049714c4a6
go: downloading github.com/360EntSecGroup-Skylar/excelize v1.4.1
go: extracting github.com/json-iterator/go v1.1.6
go: downloading github.com/gogo/protobuf v1.2.1
go: extracting golang.org/x/xerrors v0.0.0-20190513163551-3ee3066db522
go: downloading github.com/ipfs/go-todocounter v0.0.1
go: extracting github.com/ipfs/go-todocounter v0.0.1
go: extracting go.opencensus.io v0.21.0
go: downloading github.com/multiformats/go-multiaddr-dns v0.0.2
go: downloading github.com/syndtr/goleveldb v1.0.1-0.20190318030020-c3a204f8e965
go: extracting github.com/multiformats/go-multiaddr-dns v0.0.2
go: downloading go.dedis.ch/fixbuf v1.0.3
go: extracting go.dedis.ch/fixbuf v1.0.3
go: downloading github.com/jbenet/goprocess v0.1.3
go: extracting github.com/360EntSecGroup-Skylar/excelize v1.4.1
go: extracting github.com/jbenet/goprocess v0.1.3
go: downloading golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3
go: downloading github.com/go-ole/go-ole v1.2.1
go: extracting github.com/elastic/go-elasticsearch/v7 v7.1.0
go: extracting github.com/syndtr/goleveldb v1.0.1-0.20190318030020-c3a204f8e965
go: downloading github.com/prometheus/common v0.4.1
go: downloading github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90
go: extracting github.com/go-ole/go-ole v1.2.1
go: downloading github.com/pkg/profile v1.3.0
go: extracting github.com/pkg/profile v1.3.0
go: downloading github.com/multiformats/go-multistream v0.1.0
go: extracting github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90
go: downloading github.com/stretchr/testify v1.3.0
go: extracting golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5
go: extracting github.com/prometheus/common v0.4.1
go: downloading github.com/libp2p/go-libp2p-routing v0.1.0
go: extracting github.com/libp2p/go-libp2p-routing v0.1.0
go: downloading github.com/satori/go.uuid v1.2.0
go: downloading github.com/beorn7/perks v1.0.0
go: downloading github.com/hashicorp/golang-lru v0.5.1
go: extracting github.com/stretchr/testify v1.3.0
go: extracting github.com/beorn7/perks v1.0.0
go: downloading gopkg.in/yaml.v2 v2.2.2
go: downloading gopkg.in/go-playground/validator.v8 v8.18.2
go: extracting github.com/satori/go.uuid v1.2.0
go: downloading github.com/pmezard/go-difflib v1.0.0
go: extracting github.com/hashicorp/golang-lru v0.5.1
go: downloading github.com/minio/sha256-simd v0.1.0
go: extracting github.com/pmezard/go-difflib v1.0.0
go: downloading github.com/prometheus/procfs v0.0.2
go: extracting gopkg.in/go-playground/validator.v8 v8.18.2
go: downloading github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826
go: extracting github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826
go: downloading github.com/libp2p/go-libp2p v0.1.0
go: extracting gopkg.in/yaml.v2 v2.2.2
go: extracting github.com/minio/sha256-simd v0.1.0
go: downloading github.com/nsf/termbox-go v0.0.0-20190121233118-02980233997d
go: extracting github.com/prometheus/procfs v0.0.2
go: downloading github.com/libp2p/go-libp2p-pubsub v0.1.0
go: downloading github.com/glycerine/go-capnproto v0.0.0-20190118050403-2d07de3aa7fc
go: extracting github.com/nsf/termbox-go v0.0.0-20190121233118-02980233997d
go: downloading github.com/libp2p/go-libp2p-peerstore v0.1.0
go: extracting github.com/multiformats/go-multistream v0.1.0
go: downloading github.com/ipfs/go-cid v0.0.2
go: extracting github.com/libp2p/go-libp2p v0.1.0
go: downloading github.com/gin-contrib/sse v0.0.0-20170109093832-22d885f9ecc7
go: extracting github.com/libp2p/go-libp2p-pubsub v0.1.0
go: downloading github.com/mattn/go-colorable v0.1.1
go: extracting github.com/gin-contrib/sse v0.0.0-20170109093832-22d885f9ecc7
go: downloading github.com/btcsuite/btcutil v0.0.0-20190425235716-9e5f4b9a998d
go: extracting github.com/libp2p/go-libp2p-peerstore v0.1.0
go: extracting github.com/mattn/go-colorable v0.1.1
go: downloading github.com/multiformats/go-multihash v0.0.5
go: downloading github.com/AndreasBriese/bbloom v0.0.0-20180913140656-343706a395b7
go: extracting github.com/ipfs/go-cid v0.0.2
go: downloading github.com/mattn/go-runewidth v0.0.2
go: extracting github.com/glycerine/go-capnproto v0.0.0-20190118050403-2d07de3aa7fc
go: downloading github.com/ElrondNetwork/elrond-vm-common v0.0.6
go: extracting github.com/AndreasBriese/bbloom v0.0.0-20180913140656-343706a395b7
go: extracting github.com/multiformats/go-multihash v0.0.5
go: extracting github.com/ElrondNetwork/elrond-vm-common v0.0.6
go: downloading github.com/ugorji/go/codec v0.0.0-20181209151446-772ced7fd4c2
go: extracting github.com/mattn/go-runewidth v0.0.2
go: downloading github.com/whyrusleeping/base32 v0.0.0-20170828182744-c30ac30633cc
go: extracting github.com/whyrusleeping/base32 v0.0.0-20170828182744-c30ac30633cc
go: downloading github.com/libp2p/go-libp2p-loggables v0.1.0
go: extracting github.com/libp2p/go-libp2p-loggables v0.1.0
go: downloading github.com/spacemonkeygo/openssl v0.0.0-20181017203307-c2dcc5cca94a
go: extracting github.com/btcsuite/btcutil v0.0.0-20190425235716-9e5f4b9a998d
go: downloading github.com/libp2p/go-libp2p-secio v0.1.0
go: extracting github.com/spacemonkeygo/openssl v0.0.0-20181017203307-c2dcc5cca94a
go: extracting github.com/libp2p/go-libp2p-secio v0.1.0
go: downloading github.com/spaolacci/murmur3 v1.1.0
go: downloading github.com/modern-go/reflect2 v1.0.1
go: extracting github.com/spaolacci/murmur3 v1.1.0
go: downloading github.com/glycerine/rbtree v0.0.0-20180524195614-80eebfe947f7
go: extracting github.com/modern-go/reflect2 v1.0.1
go: downloading github.com/libp2p/go-libp2p-peer v0.2.0
go: extracting github.com/glycerine/rbtree v0.0.0-20180524195614-80eebfe947f7
go: downloading github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
go: extracting github.com/libp2p/go-libp2p-peer v0.2.0
go: downloading github.com/libp2p/go-libp2p-netutil v0.1.0
go: extracting golang.org/x/sys v0.0.0-20190531073156-46560c3f3c0a
go: extracting github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
go: downloading github.com/libp2p/go-ws-transport v0.1.0
go: extracting golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3
go: extracting github.com/libp2p/go-ws-transport v0.1.0
go: downloading github.com/libp2p/go-flow-metrics v0.0.1
go: extracting github.com/libp2p/go-libp2p-netutil v0.1.0
go: downloading github.com/dustin/go-humanize v1.0.0
go: extracting github.com/libp2p/go-flow-metrics v0.0.1
go: downloading github.com/davecgh/go-spew v1.1.1
go: extracting github.com/davecgh/go-spew v1.1.1
go: extracting github.com/btcsuite/btcd v0.0.0-20190523000118-16327141da8c
go: downloading github.com/boltdb/bolt v1.3.1
go: downloading github.com/gin-contrib/pprof v1.2.0
go: extracting github.com/ugorji/go/codec v0.0.0-20181209151446-772ced7fd4c2
go: extracting github.com/dustin/go-humanize v1.0.0
go: downloading github.com/spacemonkeygo/spacelog v0.0.0-20180420211403-2296661a0572
go: downloading github.com/ipfs/go-datastore v0.0.5
go: downloading github.com/golang/snappy v0.0.1
go: downloading github.com/libp2p/go-libp2p-yamux v0.2.0
go: extracting github.com/spacemonkeygo/spacelog v0.0.0-20180420211403-2296661a0572
go: extracting github.com/gin-contrib/pprof v1.2.0
go: downloading github.com/multiformats/go-multibase v0.0.1
go: downloading github.com/dgryski/go-farm v0.0.0-20190104051053-3adb47b1fb0f
go: extracting github.com/boltdb/bolt v1.3.1
go: extracting github.com/libp2p/go-libp2p-yamux v0.2.0
go: downloading github.com/libp2p/go-libp2p-mplex v0.2.1
go: extracting github.com/dgryski/go-farm v0.0.0-20190104051053-3adb47b1fb0f
go: downloading github.com/beevik/ntp v0.2.0
go: downloading github.com/libp2p/go-tcp-transport v0.1.0
go: extracting github.com/golang/snappy v0.0.1
go: downloading github.com/libp2p/go-libp2p-crypto v0.1.0
go: downloading github.com/libp2p/go-libp2p-transport-upgrader v0.1.1
go: extracting github.com/beevik/ntp v0.2.0
go: extracting github.com/ipfs/go-datastore v0.0.5
go: downloading github.com/minio/blake2b-simd v0.0.0-20160723061019-3f5f724cb5b1
go: extracting github.com/libp2p/go-tcp-transport v0.1.0
go: extracting github.com/multiformats/go-multibase v0.0.1
go: extracting github.com/libp2p/go-libp2p-mplex v0.2.1
go: downloading github.com/libp2p/go-buffer-pool v0.0.2
go: downloading github.com/libp2p/go-yamux v1.2.2
go: downloading github.com/mitchellh/go-wordwrap v0.0.0-20150314170334-ad45545899c7
go: downloading github.com/google/gops v0.3.6
go: extracting github.com/libp2p/go-libp2p-crypto v0.1.0
go: extracting github.com/libp2p/go-libp2p-transport-upgrader v0.1.1
go: downloading github.com/coreos/go-semver v0.3.0
go: downloading github.com/urfave/cli v1.20.0
go: extracting github.com/libp2p/go-buffer-pool v0.0.2
go: downloading github.com/ElrondNetwork/concurrent-map v0.1.2
go: extracting github.com/mitchellh/go-wordwrap v0.0.0-20150314170334-ad45545899c7
go: extracting github.com/minio/blake2b-simd v0.0.0-20160723061019-3f5f724cb5b1
go: downloading github.com/whyrusleeping/mafmt v1.2.8
go: extracting github.com/libp2p/go-yamux v1.2.2
go: downloading github.com/gin-contrib/cors v0.0.0-20190301062745-f9e10995c85a
go: downloading github.com/matttproud/golang_protobuf_extensions v1.0.1
go: extracting github.com/coreos/go-semver v0.3.0
go: downloading github.com/multiformats/go-multiaddr-fmt v0.0.1
go: extracting github.com/whyrusleeping/mafmt v1.2.8
go: downloading github.com/whyrusleeping/go-keyspace v0.0.0-20160322163242-5b898ac5add1
go: extracting github.com/ElrondNetwork/concurrent-map v0.1.2
go: downloading github.com/multiformats/go-base32 v0.0.3
go: extracting github.com/gin-contrib/cors v0.0.0-20190301062745-f9e10995c85a
go: downloading github.com/libp2p/go-libp2p-testing v0.0.3
go: extracting github.com/urfave/cli v1.20.0
go: extracting github.com/multiformats/go-multiaddr-fmt v0.0.1
go: downloading github.com/libp2p/go-mplex v0.1.0
go: extracting github.com/whyrusleeping/go-keyspace v0.0.0-20160322163242-5b898ac5add1
go: extracting github.com/matttproud/golang_protobuf_extensions v1.0.1
go: downloading github.com/libp2p/go-conn-security-multistream v0.1.0
go: extracting github.com/multiformats/go-base32 v0.0.3
go: downloading github.com/whyrusleeping/go-logging v0.0.0-20170515211332-0457bb6b88fc
go: downloading github.com/jbenet/go-temp-err-catcher v0.0.0-20150120210811-aac704a3f4f2
go: downloading github.com/libp2p/go-stream-muxer-multistream v0.2.0
go: extracting github.com/libp2p/go-libp2p-testing v0.0.3
go: downloading github.com/libp2p/go-libp2p-swarm v0.1.0
go: extracting github.com/jbenet/go-temp-err-catcher v0.0.0-20150120210811-aac704a3f4f2
go: downloading github.com/libp2p/go-libp2p-circuit v0.1.0
go: extracting github.com/libp2p/go-conn-security-multistream v0.1.0
go: downloading github.com/libp2p/go-libp2p-nat v0.0.4
go: extracting github.com/libp2p/go-mplex v0.1.0
go: downloading github.com/libp2p/go-maddr-filter v0.0.4
go: extracting github.com/libp2p/go-stream-muxer-multistream v0.2.0
go: downloading github.com/google/uuid v1.1.1
go: extracting github.com/whyrusleeping/go-logging v0.0.0-20170515211332-0457bb6b88fc
go: extracting github.com/libp2p/go-libp2p-swarm v0.1.0
go: downloading github.com/libp2p/go-reuseport v0.0.1
go: downloading github.com/libp2p/go-msgio v0.0.2
go: extracting github.com/google/uuid v1.1.1
go: downloading github.com/multiformats/go-multiaddr-net v0.0.1
go: extracting github.com/libp2p/go-maddr-filter v0.0.4
go: extracting github.com/libp2p/go-libp2p-nat v0.0.4
go: downloading github.com/libp2p/go-reuseport-transport v0.0.2
go: extracting github.com/libp2p/go-libp2p-circuit v0.1.0
go: downloading github.com/whyrusleeping/go-notifier v0.0.0-20170827234753-097c5d47330f
go: extracting github.com/libp2p/go-msgio v0.0.2
go: downloading github.com/gorilla/websocket v1.4.0
go: downloading github.com/libp2p/go-nat v0.0.3
go: extracting github.com/libp2p/go-reuseport v0.0.1
go: downloading github.com/whyrusleeping/mdns v0.0.0-20180901202407-ef14215e6b30
go: extracting github.com/multiformats/go-multiaddr-net v0.0.1
go: downloading github.com/libp2p/go-addr-util v0.0.1
go: extracting github.com/libp2p/go-reuseport-transport v0.0.2
go: extracting github.com/libp2p/go-nat v0.0.3
go: downloading github.com/libp2p/go-libp2p-discovery v0.1.0
go: extracting github.com/whyrusleeping/mdns v0.0.0-20180901202407-ef14215e6b30
go: downloading github.com/jackpal/gateway v1.0.5
go: extracting github.com/whyrusleeping/go-notifier v0.0.0-20170827234753-097c5d47330f
go: downloading github.com/libp2p/go-libp2p-autonat v0.1.0
go: downloading github.com/huin/goupnp v1.0.0
go: extracting github.com/libp2p/go-libp2p-autonat v0.1.0
go: downloading github.com/miekg/dns v1.1.12
go: extracting github.com/jackpal/gateway v1.0.5
go: extracting github.com/libp2p/go-libp2p-discovery v0.1.0
go: downloading github.com/whyrusleeping/multiaddr-filter v0.0.0-20160516205228-e903e4adabd7
go: extracting github.com/gorilla/websocket v1.4.0
go: downloading github.com/koron/go-ssdp v0.0.0-20180514024734-4a0ed625a78b
go: extracting github.com/libp2p/go-addr-util v0.0.1
go: extracting github.com/whyrusleeping/multiaddr-filter v0.0.0-20160516205228-e903e4adabd7
go: downloading github.com/jackpal/go-nat-pmp v1.0.1
go: extracting github.com/koron/go-ssdp v0.0.0-20180514024734-4a0ed625a78b
go: extracting github.com/jackpal/go-nat-pmp v1.0.1
go: extracting github.com/huin/goupnp v1.0.0
go: downloading golang.org/x/text v0.3.0
go: extracting github.com/google/gops v0.3.6
go: downloading github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0
go: extracting github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0
go: extracting github.com/gogo/protobuf v1.2.1
go: extracting github.com/miekg/dns v1.1.12
go: extracting golang.org/x/text v0.3.0
go: extracting github.com/ElrondNetwork/elrond-vm v0.0.15
golang.org/x/net/internal/iana
github.com/ElrondNetwork/elrond-go/data/typeConverters
github.com/ElrondNetwork/elrond-go/storage
github.com/elastic/go-elasticsearch/v7/internal/version
golang.org/x/net/bpf
github.com/ElrondNetwork/elrond-go/consensus
golang.org/x/net/internal/socket
github.com/glycerine/rbtree
github.com/ElrondNetwork/elrond-go/sharding
github.com/mr-tron/base58/base58
golang.org/x/net/ipv4
golang.org/x/crypto/sha3
github.com/glycerine/go-capnproto
github.com/ElrondNetwork/elrond-go/p2p
github.com/ElrondNetwork/elrond-go/hashing/sha256
github.com/ElrondNetwork/elrond-go/hashing/keccak
github.com/ElrondNetwork/elrond-vm-common
github.com/ElrondNetwork/elrond-go/core/partitioning
github.com/ElrondNetwork/elrond-go/process/smartContract/hooks
github.com/beevik/ntp
github.com/gin-gonic/gin/json
github.com/ElrondNetwork/elrond-go/ntp
github.com/elastic/go-elasticsearch/v7/estransport
github.com/ElrondNetwork/elrond-go/consensus/round
github.com/elastic/go-elasticsearch/v7/esapi
github.com/ElrondNetwork/elrond-go/data/block/capnp
github.com/ElrondNetwork/elrond-go/data/smartContractResult/capnp
github.com/ElrondNetwork/elrond-go/data/transaction/capnp
github.com/ElrondNetwork/elrond-go/data/smartContractResult
go.dedis.ch/kyber/v3/sign/bls
go.dedis.ch/kyber/v3/sign/schnorr
github.com/ElrondNetwork/elrond-go/crypto/signing/kyber/singlesig
github.com/ElrondNetwork/elrond-go/data/transaction
github.com/ElrondNetwork/elrond-go/crypto/signing/kyber/multisig
github.com/ElrondNetwork/elrond-go/crypto/signing/multisig
github.com/gizak/termui/v3/drawille
github.com/mattn/go-runewidth
github.com/mitchellh/go-wordwrap
github.com/beorn7/perks/quantile
github.com/nsf/termbox-go
github.com/ElrondNetwork/elrond-go/data/block
github.com/golang/protobuf/proto
github.com/gizak/termui/v3
github.com/ElrondNetwork/elrond-go/dataRetriever
github.com/ElrondNetwork/elrond-go/process
github.com/ElrondNetwork/elrond-go/core/statistics
github.com/gizak/termui/v3/widgets
github.com/ElrondNetwork/elrond-go/core/genesis
github.com/prometheus/common/internal/bitbucket.org/ww/goautoneg
github.com/prometheus/common/model
github.com/prometheus/procfs/internal/fs
github.com/prometheus/procfs
github.com/ElrondNetwork/elrond-go/statusHandler/termuic/termuiRenders
github.com/ElrondNetwork/elrond-go/statusHandler/termuic
github.com/ElrondNetwork/elrond-go/data/state/factory
github.com/ElrondNetwork/elrond-go/data/trie/capnp
github.com/ElrondNetwork/elrond-go/data/typeConverters/uint64ByteSlice
github.com/ElrondNetwork/elrond-go/dataRetriever/dataPool
github.com/dchest/siphash
github.com/ElrondNetwork/elrond-go/core/random
github.com/prometheus/client_model/go
github.com/matttproud/golang_protobuf_extensions/pbutil
github.com/ElrondNetwork/elrond-go/data/trie/proto
github.com/cornelk/hashmap
github.com/ElrondNetwork/elrond-go/data/trie
github.com/prometheus/client_golang/prometheus/internal
github.com/prometheus/common/expfmt
github.com/ElrondNetwork/elrond-go/dataRetriever/factory/containers
github.com/ElrondNetwork/elrond-go/dataRetriever/resolvers
github.com/ElrondNetwork/elrond-go/dataRetriever/resolvers/topicResolverSender
github.com/ElrondNetwork/elrond-go/process/factory
github.com/ElrondNetwork/elrond-go/dataRetriever/factory/metachain
github.com/ElrondNetwork/elrond-go/dataRetriever/factory/shard
github.com/ElrondNetwork/elrond-go/dataRetriever/requestHandlers
github.com/ElrondNetwork/elrond-go/hashing/blake2b
github.com/prometheus/client_golang/prometheus
github.com/ElrondNetwork/elrond-go/hashing/fnv
github.com/dgraph-io/badger/options
github.com/dgraph-io/badger/pb
github.com/pkg/errors
golang.org/x/net/internal/timeseries
github.com/AndreasBriese/bbloom
golang.org/x/net/trace
github.com/dgryski/go-farm
github.com/dustin/go-humanize
github.com/dgraph-io/badger/y
github.com/ElrondNetwork/elrond-go/storage/bloom
github.com/ElrondNetwork/elrond-go/statusHandler
github.com/boltdb/bolt
github.com/dgraph-io/badger/skl
github.com/ElrondNetwork/elrond-go/data/blockchain
github.com/dgraph-io/badger/table
github.com/ElrondNetwork/concurrent-map
github.com/ElrondNetwork/elrond-go/storage/fifocache
github.com/dgraph-io/badger
github.com/syndtr/goleveldb/leveldb/util
github.com/syndtr/goleveldb/leveldb/cache
github.com/ElrondNetwork/elrond-go/storage/boltdb
github.com/syndtr/goleveldb/leveldb/comparer
github.com/syndtr/goleveldb/leveldb/storage
github.com/syndtr/goleveldb/leveldb/filter
github.com/syndtr/goleveldb/leveldb/opt
github.com/golang/snappy
github.com/elastic/go-elasticsearch/v7
github.com/ElrondNetwork/elrond-go/core/indexer
github.com/hashicorp/golang-lru/simplelru
github.com/syndtr/goleveldb/leveldb/errors
github.com/hashicorp/golang-lru
github.com/syndtr/goleveldb/leveldb/iterator
github.com/ElrondNetwork/elrond-go/core/serviceContainer
github.com/syndtr/goleveldb/leveldb/journal
github.com/ElrondNetwork/elrond-go/storage/lrucache
github.com/syndtr/goleveldb/leveldb/memdb
github.com/ElrondNetwork/elrond-go/storage/badgerdb
github.com/syndtr/goleveldb/leveldb/table
github.com/ElrondNetwork/elrond-go/p2p/loadBalancer
github.com/gogo/protobuf/io
github.com/ipfs/go-log/tracer/wire
github.com/whyrusleeping/go-logging
github.com/opentracing/opentracing-go/log
golang.org/x/net/context
github.com/mattn/go-isatty
github.com/opentracing/opentracing-go
github.com/mattn/go-colorable
github.com/syndtr/goleveldb/leveldb
github.com/ipfs/go-log/writer
github.com/libp2p/go-buffer-pool
github.com/opentracing/opentracing-go/ext
github.com/libp2p/go-libp2p-circuit/pb
github.com/coreos/go-semver/semver
github.com/ipfs/go-log/tracer
github.com/jbenet/goprocess
github.com/libp2p/go-libp2p-core/crypto/pb
github.com/btcsuite/btcd/btcec
github.com/ipfs/go-log
github.com/minio/sha256-simd
golang.org/x/crypto/ed25519/internal/edwards25519
github.com/libp2p/go-libp2p-core/mux
github.com/minio/blake2b-simd
github.com/spaolacci/murmur3
golang.org/x/crypto/ed25519
github.com/libp2p/go-libp2p-core/crypto
golang.org/x/crypto/blake2s
github.com/ElrondNetwork/elrond-go/storage/leveldb
github.com/libp2p/go-libp2p-core/protocol
github.com/jbenet/go-temp-err-catcher
github.com/ElrondNetwork/elrond-go/storage/storageUnit
github.com/multiformats/go-multihash
github.com/libp2p/go-libp2p-core/pnet
github.com/libp2p/go-flow-metrics
github.com/libp2p/go-mplex
github.com/libp2p/go-libp2p-crypto
github.com/multiformats/go-multiaddr
github.com/ElrondNetwork/elrond-go/dataRetriever/shardedData
github.com/libp2p/go-libp2p-secio/pb
github.com/libp2p/go-msgio
github.com/libp2p/go-libp2p-mplex
golang.org/x/crypto/blowfish
github.com/libp2p/go-yamux
github.com/libp2p/go-libp2p-core/peer
github.com/multiformats/go-multiaddr-dns
github.com/whyrusleeping/mafmt
github.com/multiformats/go-multistream
github.com/multiformats/go-multiaddr-net
github.com/libp2p/go-libp2p-core/peerstore
github.com/libp2p/go-libp2p-core/network
github.com/libp2p/go-libp2p-core/metrics
github.com/libp2p/go-libp2p-peer
github.com/libp2p/go-libp2p-peerstore
github.com/libp2p/go-libp2p-core/helpers
github.com/libp2p/go-libp2p-core/connmgr
github.com/libp2p/go-libp2p-core/transport
github.com/libp2p/go-libp2p-core/sec
github.com/libp2p/go-libp2p-core/host
github.com/libp2p/go-libp2p-secio
github.com/libp2p/go-libp2p-yamux
github.com/libp2p/go-conn-security-multistream
github.com/multiformats/go-base32
github.com/libp2p/go-libp2p-core/sec/insecure
github.com/libp2p/go-maddr-filter
github.com/libp2p/go-libp2p-peerstore/addr
github.com/libp2p/go-libp2p-core/discovery
github.com/multiformats/go-multibase
github.com/libp2p/go-libp2p-peerstore/pstoremem
github.com/libp2p/go-libp2p-transport-upgrader
github.com/jbenet/goprocess/context
github.com/ipfs/go-cid
github.com/libp2p/go-addr-util
github.com/libp2p/go-libp2p-circuit
github.com/google/uuid
github.com/whyrusleeping/multiaddr-filter
github.com/libp2p/go-libp2p-core/routing
github.com/jbenet/goprocess/periodic
github.com/libp2p/go-libp2p-loggables
github.com/libp2p/go-libp2p-discovery
github.com/huin/goupnp/httpu
github.com/huin/goupnp/scpd
github.com/libp2p/go-libp2p-swarm
github.com/huin/goupnp/soap
golang.org/x/net/html/atom
github.com/huin/goupnp/ssdp
golang.org/x/net/html
golang.org/x/text/encoding/internal/identifier
golang.org/x/text/transform
golang.org/x/text/internal/utf8internal
golang.org/x/text/internal/tag
github.com/jackpal/gateway
golang.org/x/text/language
golang.org/x/text/encoding
golang.org/x/text/runes
golang.org/x/text/encoding/internal
github.com/jackpal/go-nat-pmp
golang.org/x/text/encoding/charmap
golang.org/x/text/encoding/japanese
golang.org/x/text/encoding/korean
golang.org/x/text/encoding/simplifiedchinese
golang.org/x/text/encoding/traditionalchinese
golang.org/x/text/encoding/unicode
github.com/koron/go-ssdp
github.com/jbenet/goprocess/ratelimit
github.com/whyrusleeping/go-notifier
github.com/libp2p/go-libp2p/p2p/protocol/identify/pb
github.com/ipfs/go-ipfs-util
github.com/libp2p/go-libp2p-autonat/pb
github.com/libp2p/go-libp2p/p2p/protocol/ping
github.com/libp2p/go-libp2p/p2p/protocol/identify
golang.org/x/text/encoding/htmlindex
github.com/libp2p/go-libp2p/p2p/host/routed
golang.org/x/net/html/charset
github.com/libp2p/go-stream-muxer-multistream
github.com/libp2p/go-libp2p-autonat
github.com/huin/goupnp
github.com/libp2p/go-reuseport
github.com/multiformats/go-multiaddr-fmt
github.com/huin/goupnp/dcps/internetgateway1
github.com/huin/goupnp/dcps/internetgateway2
github.com/libp2p/go-reuseport-transport
github.com/gorilla/websocket
github.com/libp2p/go-tcp-transport
github.com/libp2p/go-libp2p-pubsub/pb
github.com/whyrusleeping/timecache
github.com/libp2p/go-nat
github.com/libp2p/go-libp2p-core/test
github.com/libp2p/go-ws-transport
github.com/libp2p/go-libp2p-testing/etc
github.com/libp2p/go-libp2p-pubsub
github.com/libp2p/go-libp2p-testing/net
github.com/libp2p/go-libp2p-nat
github.com/libp2p/go-libp2p-netutil
github.com/ipfs/go-datastore/query
github.com/libp2p/go-libp2p/p2p/host/basic
github.com/ipfs/go-todocounter
github.com/libp2p/go-libp2p-record/pb
github.com/ipfs/go-datastore
github.com/libp2p/go-libp2p-kad-dht/pb
github.com/libp2p/go-libp2p/p2p/host/relay
github.com/libp2p/go-libp2p/p2p/net/mock
go.opencensus.io/resource
go.opencensus.io/tag
github.com/libp2p/go-libp2p/config
go.opencensus.io/metric/metricdata
go.opencensus.io/internal/tagencoding
go.opencensus.io/stats/internal
github.com/libp2p/go-libp2p
go.opencensus.io/stats
go.opencensus.io/metric/metricproducer
github.com/ipfs/go-datastore/sync
go.opencensus.io/stats/view
github.com/libp2p/go-libp2p-record
github.com/ipfs/go-datastore/autobatch
github.com/ElrondNetwork/elrond-go/p2p/libp2p
github.com/libp2p/go-libp2p-kad-dht/opts
github.com/whyrusleeping/base32
github.com/libp2p/go-libp2p-kbucket/keyspace
github.com/libp2p/go-libp2p-kad-dht/metrics
github.com/libp2p/go-libp2p-kad-dht/providers
github.com/libp2p/go-libp2p-kbucket
github.com/whyrusleeping/go-keyspace
github.com/libp2p/go-libp2p-routing/notifications
golang.org/x/xerrors/internal
golang.org/x/net/ipv6
golang.org/x/xerrors
github.com/libp2p/go-libp2p-peerstore/queue
github.com/ElrondNetwork/elrond-go/display
github.com/ElrondNetwork/elrond-go/process/throttle
github.com/libp2p/go-libp2p-kad-dht
github.com/ElrondNetwork/elrond-go/process/coordinator
github.com/ElrondNetwork/elrond-go/process/block
github.com/ElrondNetwork/elrond-go/process/dataValidators
github.com/ElrondNetwork/elrond-go/process/factory/containers
github.com/miekg/dns
github.com/ElrondNetwork/elrond-go/process/block/preprocess
github.com/ElrondNetwork/elrond-go/process/transaction
github.com/ElrondNetwork/elrond-go/process/unsigned
github.com/ElrondNetwork/elrond-vm/iele/elrond/node/iele-testing-kompiled/ieletestingmodel
github.com/ElrondNetwork/elrond-vm/iele/elrond/node/iele-testing-kompiled/koreparser
github.com/ElrondNetwork/elrond-go/process/block/interceptors
github.com/ElrondNetwork/elrond-go/process/factory/metachain
github.com/ElrondNetwork/elrond-go/process/smartContract
github.com/ElrondNetwork/elrond-go/process/sync
github.com/ElrondNetwork/elrond-go/process/track
github.com/ElrondNetwork/elrond-go/storage/memorydb
github.com/ElrondNetwork/elrond-go/core/appStatusPolling
github.com/shirou/gopsutil/internal/common
github.com/ElrondNetwork/elrond-go/api/errors
github.com/gin-contrib/sse
github.com/shirou/gopsutil/cpu
github.com/shirou/gopsutil/mem
github.com/shirou/gopsutil/net
github.com/ugorji/go/codec
github.com/ElrondNetwork/elrond-go/core/statistics/machine
gopkg.in/go-playground/validator.v8
gopkg.in/yaml.v2
github.com/whyrusleeping/mdns
github.com/libp2p/go-libp2p/p2p/discovery
github.com/ElrondNetwork/elrond-go/p2p/libp2p/discovery
github.com/ElrondNetwork/elrond-go/p2p/libp2p/factory
github.com/ElrondNetwork/elrond-go/node/heartbeat
github.com/prometheus/client_golang/prometheus/promhttp
github.com/ElrondNetwork/elrond-go/consensus/chronology
github.com/ElrondNetwork/elrond-go/consensus/spos
github.com/ElrondNetwork/elrond-go/consensus/broadcast
github.com/ElrondNetwork/elrond-go/consensus/spos/commonSubround
github.com/ElrondNetwork/elrond-go/consensus/validators
github.com/ElrondNetwork/elrond-go/consensus/validators/groupSelectors
github.com/ElrondNetwork/elrond-go/node/external
github.com/google/gops/internal
github.com/google/gops/signal
github.com/kardianos/osext
github.com/ElrondNetwork/elrond-go/consensus/spos/bls
github.com/ElrondNetwork/elrond-go/consensus/spos/bn
github.com/google/gops/agent
github.com/ElrondNetwork/elrond-vm/iele/elrond/node/hookadapter/krypto
github.com/ElrondNetwork/elrond-vm/iele/elrond/node/hookadapter/blockchain
github.com/ElrondNetwork/elrond-go/consensus/spos/sposFactory
github.com/ElrondNetwork/elrond-go/node
github.com/ElrondNetwork/elrond-vm/iele/elrond/node/iele-testing-kompiled/ieletestinginterpreter
github.com/gin-gonic/gin/binding
github.com/gin-gonic/gin/render
github.com/gin-gonic/gin
github.com/ElrondNetwork/elrond-go/api/middleware
github.com/ElrondNetwork/elrond-go/api/node
github.com/ElrondNetwork/elrond-go/api/address
github.com/ElrondNetwork/elrond-go/api/transaction
github.com/ElrondNetwork/elrond-go/api/vmValues
github.com/gin-contrib/cors
github.com/gin-contrib/pprof
github.com/ElrondNetwork/elrond-go/api
github.com/ElrondNetwork/elrond-go/facade
github.com/ElrondNetwork/elrond-vm/iele/elrond/node/endpoint
github.com/ElrondNetwork/elrond-go/process/factory/shard
github.com/ElrondNetwork/elrond-go/cmd/node/factory
github.com/ElrondNetwork/elrond-go/cmd/node
Removing intermediate container 45baef7d4a63
 ---> d5a4f2438daa
Step 7/15 : ARG CONFIG_VERSION
 ---> Running in e4b2d9c183de
Removing intermediate container e4b2d9c183de
 ---> 89545fc2cb6e
Step 8/15 : WORKDIR /opt
 ---> Running in d6ab2382ce02
Removing intermediate container d6ab2382ce02
 ---> d4bfa4d2fa58
Step 9/15 : RUN git clone -b ${CONFIG_VERSION} https://github.com/ElrondNetwork/elrond-config
 ---> Running in 7b6e6dc251b7
Cloning into 'elrond-config'...
Note: checking out 'd8142a0e8af3fe822776f87294507feacab1220f'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

Removing intermediate container 7b6e6dc251b7
 ---> 5c5418ae1044

Step 10/15 : FROM alpine
 ---> 961769676411
Step 11/15 : WORKDIR /opt/app
 ---> Using cache
 ---> dfbc219d4ac3
Step 12/15 : COPY --from=build /opt/elrond-config/ /tmp/config/
 ---> e60671806e73
Step 13/15 : COPY --from=build /opt/elrond-go/cmd/keygenerator/keygenerator /opt/elrond-go/cmd/node/node /opt/app/
 ---> 5f54429a2591
Step 14/15 : RUN ln -s /opt/app/node /usr/local/bin/ &&     ln -s /opt/app/keygenerator /usr/local/bin/
 ---> Running in e4f714addd8d
Removing intermediate container e4f714addd8d
 ---> 71d320179ebb
Step 15/15 : CMD node --use-log-view
 ---> Running in aa0393ce4fe4
Removing intermediate container aa0393ce4fe4
 ---> 012866c9e423

Successfully built 012866c9e423
Successfully tagged elrond-node_elrond:latest
mrz1703@zero:/tmp/elrond-node$ 
mrz1703@zero:/tmp/elrond-node$ 
mrz1703@zero:/tmp/elrond-node$ ls -la
итого 32
drwxr-xr-x  4 rudko rudko 4096 сен 10 19:42 .
drwxrwxrwt 21 root  root  4096 сен 10 19:47 ..
drwxr-xr-x  2 rudko rudko 4096 сен 10 19:42 .build
-rw-r--r--  1 rudko rudko  389 сен 10 19:42 docker-compose.yml
drwxr-xr-x  8 rudko rudko 4096 сен 10 19:42 .git
-rw-r--r--  1 rudko rudko    8 сен 10 19:42 .gitignore
-rw-r--r--  1 rudko rudko 1178 сен 10 19:42 README.md
-rw-r--r--  1 rudko rudko 1543 сен 10 19:42 README.RU.md
mrz1703@zero:/tmp/elrond-node$ docker-compose run -w /opt/app/config elrond sh -c "keygenerator > output_keys"
Creating network "elrond-node_default" with the default driver
mrz1703@zero:/tmp/elrond-node$ ls -la
итого 48
drwxr-xr-x  8 rudko rudko 4096 сен 10 19:48 .
drwxrwxrwt 21 root  root  4096 сен 10 19:48 ..
drwxr-xr-x  2 rudko rudko 4096 сен 10 19:42 .build
drwxr-xr-x  2 root  root  4096 сен 10 19:48 config
drwxr-xr-x  2 root  root  4096 сен 10 19:48 db
-rw-r--r--  1 rudko rudko  389 сен 10 19:42 docker-compose.yml
drwxr-xr-x  8 rudko rudko 4096 сен 10 19:42 .git
-rw-r--r--  1 rudko rudko    8 сен 10 19:42 .gitignore
drwxr-xr-x  2 root  root  4096 сен 10 19:48 logs
-rw-r--r--  1 rudko rudko 1178 сен 10 19:42 README.md
-rw-r--r--  1 rudko rudko 1543 сен 10 19:42 README.RU.md
drwxr-xr-x  2 root  root  4096 сен 10 19:48 stats
mrz1703@zero:/tmp/elrond-node$ ls -la config/
итого 20
drwxr-xr-x 2 root  root  4096 сен 10 19:48 .
drwxr-xr-x 8 rudko rudko 4096 сен 10 19:48 ..
-rw-r--r-- 1 root  root   282 сен 10 19:48 initialBalancesSk.pem
-rw-r--r-- 1 root  root   666 сен 10 19:48 initialNodesSk.pem
-rw-r--r-- 1 root  root   515 сен 10 19:48 output_keys
mrz1703@zero:/tmp/elrond-node$ cat config/output_keys 
Files generated successfully.
	public key for balance:	2bc70e08f245f584a5362d6aab162f0627d9208971cb57eb85e366a20f7b1bbb
	public key for balance - in bech32 format:	erd190rsuz8jgh6cfffk9442k930qcnajgyfw89406u9udn2yrmmrwas700y9t
	public key for block signing:	4431f0d37c0b1ba7c09d6c4bf3b82c9b171af0805f5e4765e7e81323f742dcee0a7ff6c5923fb16534d935dc964abd4323f89dc8d0a1cc365e1838ab5f62ff2e21705217e665e7d6ac7fb85698be27e1fa2c5e6ef5891c31bf4e41a0e150f77b39500b3b64c5538aa1bc02dc4e9c7516942175f5f0214afba2ea8354fd7ac353
mrz1703@zero:/tmp/elrond-node$ 
mrz1703@zero:/tmp/elrond-node$ docker-compose run -w /opt/app/config elrond sh -c "cp /tmp/config/* /opt/app/config/"
mrz1703@zero:/tmp/elrond-node$ ls -la config/
итого 112
drwxr-xr-x 2 root  root   4096 сен 10 19:48 .
drwxr-xr-x 8 rudko rudko  4096 сен 10 19:48 ..
-rw-r--r-- 1 root  root   5332 сен 10 19:48 config.toml
-rw-r--r-- 1 root  root  22890 сен 10 19:48 genesis.json
-rw-r--r-- 1 root  root    282 сен 10 19:48 initialBalancesSk.pem
-rw-r--r-- 1 root  root    666 сен 10 19:48 initialNodesSk.pem
-rw-r--r-- 1 root  root  48608 сен 10 19:48 nodesSetup.json
-rw-r--r-- 1 root  root    515 сен 10 19:48 output_keys
-rw-r--r-- 1 root  root   3244 сен 10 19:48 p2p.toml
-rw-r--r-- 1 root  root    610 сен 10 19:48 README.md
-rw-r--r-- 1 root  root    213 сен 10 19:48 server.toml
mrz1703@zero:/tmp/elrond-node$ 
mrz1703@zero:/tmp/elrond-node$ docker-compose up -d
Creating elrond ... done
mrz1703@zero:/tmp/elrond-node$ docker-compose logs --tail 100
Attaching to elrond
elrond    | 
elrond    | received all the requested mini blocks from network
elrond    | 
elrond    | Total txs in pool: 50
elrond    | 
elrond    | requested 1 missing txs
elrond    | 
elrond    | received 1 missing txs
elrond    | 
elrond    | requested 1 missing meta headers and 0 final meta headers
elrond    | 
elrond    | requested 1 missing final meta headers
elrond    | 
elrond    | received 1 missing meta headers
elrond    | 
elrond    | time elapsed to process block: 0.354040476 sec
elrond    | 
elrond    | last notarized block from shard 4294967295 has: round = 1, nonce = 1, hash = nTILRubJzWmTM2s+OGJfw0eCl9f+uEzgz5QgqTOrczQ=
elrond    | 
elrond    | shardBlock with nonce 3 and hash ZBICDzW0kkx/FPuPu/u9Ctf68u3HAumETeZlXwm+FI8= has been committed successfully
elrond    | 
elrond    | time elapsed to commit block: 0.019104586 sec
elrond    | 
elrond    | block with nonce 3 has been synced successfully
elrond    | 
elrond    | +-----------------+-----------------+------------------------------------------------------------------------------------------+
elrond    | | Part            | Parameter       | Value                                                                                    |
elrond    | +-----------------+-----------------+------------------------------------------------------------------------------------------+
elrond    | | Header          | Block type      | TxBlock                                                                                  |
elrond    | |                 | Shard           | 0                                                                                        |
elrond    | |                 | Epoch           | 0                                                                                        |
elrond    | |                 | Round           | 3                                                                                        |
elrond    | |                 | TimeStamp       | 1565884812                                                                               |
elrond    | |                 | Nonce           | 3                                                                                        |
elrond    | |                 | Prev hash       | pI3IG+DVbU45NvW2V9p7D8kc0YyJc+jn5qDWkeEMW64=                                             |
elrond    | |                 | Prev rand seed  | O96KAcgAj5OTaOMFy4QprBQ4t2nMXyUfdU8YXuRiHUEn/UTelsONRg+n3MS470L9vlUCAVL6MrLXn0RjOkj2SA== |
elrond    | |                 | Rand seed       | GB0brB8lc1osQsTRALT1v+9OV2+G2tpa+XcVW7Pu9AEoPPN37/iCTH8QqYShaqAEpA+OnQMXbU1Xx83/ImwZpQ== |
elrond    | |                 | Pub keys bitmap | 0xcf1d1f                                                                                 |
elrond    | |                 | Signature       | gFXzRdDdDKEEjOi7CpUk9MlYXUzXwpufZ02O60mmryOOAFAmovcQ6KhAuVHJjNT8LQ466ZV1e2UwTIe/TJvMlg== |
elrond    | |                 | Root hash       | bTyLhGHsrwdYVjwZ8eJe/yQLn9kUen7XzTA1GWRjtXU=                                             |
elrond    | +-----------------+-----------------+------------------------------------------------------------------------------------------+
elrond    | | MetaBlockHashes | MetaBlockHash_1 | nTILRubJzWmTM2s+OGJfw0eCl9f+uEzgz5QgqTOrczQ=                                             |
elrond    | +-----------------+-----------------+------------------------------------------------------------------------------------------+
elrond    | | MiniBlock_0     | TxHash_1        | lJ0B8npKfJVGcY9sIV69G9PxCOCtUG3oUiGDkFpvxgk=                                             |
elrond    | +-----------------+-----------------+------------------------------------------------------------------------------------------+
elrond    | 
elrond    | Header hash: ZBICDzW0kkx/FPuPu/u9Ctf68u3HAumETeZlXwm+FI8=
elrond    | 
elrond    | Total txs processed until now: 1. Total txs processed for this block: 1. Total txs remained in pool: 50
elrond    | 
elrond    | Total shards: 5. Current shard id: 0
elrond    | 
elrond    | requested header with nonce 4 from network
elrond    | 
elrond    | received requested header with nonce 4 from network and probable highest nonce is 474319
elrond    | 
elrond    | Total txs in pool: 50
elrond    | 
elrond    | requested 0 missing meta headers and 1 final meta headers
elrond    | 
elrond    | lower round in block
elrond    | received 0 missing meta headers
elrond    | 
elrond    | time elapsed to process block: 0.176719619 sec
elrond    | 
elrond    | last notarized block from shard 4294967295 has: round = 2, nonce = 2, hash = 13onzK3kX62o8iYc0JOiKYipRezMCYSkqIVvoVJAMbw=
elrond    | 
elrond    | shardBlock with nonce 4 and hash ju+JStBohyOz6+evyhsjKV9QGa5VUDSQkYwOr1mk27Q= has been committed successfully
elrond    | 
elrond    | time elapsed to commit block: 0.01023553 sec
elrond    | 
elrond    | block with nonce 4 has been synced successfully
elrond    | 
elrond    | +-----------------+-----------------+------------------------------------------------------------------------------------------+
elrond    | | Part            | Parameter       | Value                                                                                    |
elrond    | +-----------------+-----------------+------------------------------------------------------------------------------------------+
elrond    | | Header          | Block type      | TxBlock                                                                                  |
elrond    | |                 | Shard           | 0                                                                                        |
elrond    | |                 | Epoch           | 0                                                                                        |
elrond    | |                 | Round           | 4                                                                                        |
elrond    | |                 | TimeStamp       | 1565884816                                                                               |
elrond    | |                 | Nonce           | 4                                                                                        |
elrond    | |                 | Prev hash       | ZBICDzW0kkx/FPuPu/u9Ctf68u3HAumETeZlXwm+FI8=                                             |
elrond    | |                 | Prev rand seed  | GB0brB8lc1osQsTRALT1v+9OV2+G2tpa+XcVW7Pu9AEoPPN37/iCTH8QqYShaqAEpA+OnQMXbU1Xx83/ImwZpQ== |
elrond    | |                 | Rand seed       | g7An7vp5F5N/mTZoXidu13HdGtJmL9yTHLq1U25D+6CJLnPxZMbT3x8492OGo0qIqGafsw7xlVBXU39ct6d9Gw== |
elrond    | |                 | Pub keys bitmap | 0xf9a31f                                                                                 |
elrond    | |                 | Signature       | XKwFdVOJ959ki6Eu9Q4uO9xBTr8J9GOEd3sJvg6LFgMXXsprdnVnUKeWDTcIhkL4FziP4fx0+NYy+EXnL7c04w== |
elrond    | |                 | Root hash       | bTyLhGHsrwdYVjwZ8eJe/yQLn9kUen7XzTA1GWRjtXU=                                             |
elrond    | +-----------------+-----------------+------------------------------------------------------------------------------------------+
elrond    | | MetaBlockHashes | MetaBlockHash_1 | 13onzK3kX62o8iYc0JOiKYipRezMCYSkqIVvoVJAMbw=                                             |
elrond    | +-----------------+-----------------+------------------------------------------------------------------------------------------+
elrond    | 
elrond    | Header hash: ju+JStBohyOz6+evyhsjKV9QGa5VUDSQkYwOr1mk27Q=
elrond    | 
elrond    | Total txs processed until now: 1. Total txs processed for this block: 0. Total txs remained in pool: 50
elrond    | 
elrond    | Total shards: 5. Current shard id: 0
elrond    | 
elrond    | requested header with nonce 5 from network
elrond    | 
mrz1703@zero:/tmp/elrond-node$
mrz1703@zero:/tmp/elrond-node$ docker-compose ps
 Name               Command               State                        Ports                      
--------------------------------------------------------------------------------------------------
elrond   /bin/sh -c node --use-log-view   Up      0.0.0.0:38303->38303/tcp, 0.0.0.0:8080->8080/tcp
mrz1703@zero:/tmp/elrond-node$
```