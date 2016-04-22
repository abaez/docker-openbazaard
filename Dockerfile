FROM alpine

MAINTAINER Alejandro Baez <https://twitter.com/a_baez>

# Install predepends
RUN apk -U add python py-pip git

# update pip
RUN pip install --upgrade pip

# Install build depends
RUN apk add gcc libffi-dev python-dev make py-psutil zeromq-dev openssl-dev \
  libc-dev pkgconfig libbsd-dev libsodium-dev autoconf libtool \
  bsd-compat-headers

# crypto install
RUN pip install cryptography

# clone openbazaard
RUN git clone -b v0.1.7 https://github.com/OpenBazaar/OpenBazaar-Server.git \
  /app

# build install
WORKDIR /app
RUN pip install -r requirements.txt

ENTRYPOINT ["/usr/bin/python", "openbazaard.py"]

CMD ["start"]
