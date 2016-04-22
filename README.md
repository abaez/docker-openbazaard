docker-openbazaard
-----------------
[![license][2i]][2p]
[![twitter][3i]][3p]

OpenBazaar-Server treated as openbazaard application load up.

DESCRIPTION
===========

I became frustrated of getting an [openbazaar-server][4] instance running. It's not complicated to get the install, but could be easier and lighter. This container is to address that case. Everything required to run the server is set up. It uses **openbazaard** as an application through the container. At the same time, instead of using ubuntu for the base os, the container uses [alpine][5]. Among a couple reasons, my main purpose in using alpine instead of ubuntu was to get the container as small and light as possible to use on arm boards.

REQUIREMENTS
============
Not much is needed to run the container app, but you do need to address the pieces listed below.

#### ports
The following port range are exposed and should be binded:

``` Dockerfile
EXPOSE 18466-18470
```
#### volumes
The following file should be mounted or else you won't have access to the user/password assignment of the server:

``` bash
/app/ob.cfg
```

USAGE
=====

The container uses openbazaard as an application to run. To run the container, you need to have the requirements described above. The default case to run the container would be:

``` bash
docker run -v <path of ob.cfg>:/app/ob.cfg -P abaez/openbazaard
```
The container has `CMD` designed to use `openbazaard.py` commands. you can find the commands that are available to use in the [repository][6] or by running the help command:

```
docker run abaez/openbazaard help
```

[2i]: https://img.shields.io/badge/license-BSD_2-green.svg
[2p]: ./LICENSE
[3i]: https://img.shields.io/badge/twitter-a_baez-blue.svg
[3p]: https://twitter.com/a_baez
[4]: https://github.com/OpenBazaar/OpenBazaar-Server
[5]: http://alpinelinux.org/
[6]: https://github.com/OpenBazaar/OpenBazaar-Server#usage
