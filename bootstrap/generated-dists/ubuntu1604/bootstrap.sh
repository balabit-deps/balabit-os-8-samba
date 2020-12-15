#!/bin/bash

#
# This file is generated by 'bootstrap/template.py --render'
# See also bootstrap/config.py
#

set -xueo pipefail

export DEBIAN_FRONTEND=noninteractive
apt-get -y update

apt-get -y install \
    acl \
    apt-utils \
    attr \
    autoconf \
    bind9utils \
    binutils \
    bison \
    build-essential \
    curl \
    debhelper \
    dnsutils \
    docbook-xml \
    docbook-xsl \
    flex \
    gcc \
    gdb \
    git \
    gzip \
    heimdal-multidev \
    hostname \
    htop \
    krb5-config \
    krb5-kdc \
    krb5-user \
    language-pack-en \
    lcov \
    libacl1-dev \
    libaio-dev \
    libarchive-dev \
    libattr1-dev \
    libavahi-common-dev \
    libblkid-dev \
    libbsd-dev \
    libcap-dev \
    libcups2-dev \
    libdbus-1-dev \
    libglib2.0-dev \
    libgnutls28-dev \
    libgpgme11-dev \
    libicu-dev \
    libjansson-dev \
    libjs-jquery \
    libjson-perl \
    libkrb5-dev \
    libldap2-dev \
    liblmdb-dev \
    libncurses5-dev \
    libpam0g-dev \
    libparse-yapp-perl \
    libpcap-dev \
    libpopt-dev \
    libreadline-dev \
    libsystemd-dev \
    libtasn1-bin \
    libtasn1-dev \
    libunwind-dev \
    lmdb-utils \
    locales \
    lsb-release \
    make \
    mawk \
    mingw-w64 \
    nettle-dev \
    patch \
    perl \
    perl-modules \
    pkg-config \
    procps \
    psmisc \
    python-crypto \
    python-dbg \
    python-dev \
    python-dnspython \
    python-gpgme \
    python-iso8601 \
    python-markdown \
    python-pexpect \
    python3 \
    python3-crypto \
    python3-dbg \
    python3-dev \
    python3-dnspython \
    python3-gpgme \
    python3-iso8601 \
    python3-markdown \
    python3-matplotlib \
    python3-pexpect \
    rng-tools \
    rsync \
    sed \
    sudo \
    tar \
    tree \
    uuid-dev \
    xfslibs-dev \
    xsltproc \
    zlib1g-dev

apt-get -y autoremove
apt-get -y autoclean
apt-get -y clean