#
# This file is generated by 'bootstrap/template.py --render'
# See also bootstrap/config.py
#

FROM quay.io/centos/centos:stream8

# pass in with --build-arg while build
ARG SHA1SUM
RUN [ -n $SHA1SUM ] && echo $SHA1SUM > /sha1sum.txt

ADD *.sh /tmp/
# need root permission, do it before USER samba
RUN /tmp/bootstrap.sh && /tmp/locale.sh

# if ld.gold exists, force link it to ld
RUN set -x; LD=$(which ld); LD_GOLD=$(which ld.gold); test -x $LD_GOLD && ln -sf $LD_GOLD $LD && test -x $LD && echo "$LD is now $LD_GOLD"

# make test can not work with root, so we have to create a new user
RUN useradd -m -U -s /bin/bash samba && \
    mkdir -p /etc/sudoers.d && \
    echo "samba ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/samba

USER samba
WORKDIR /home/samba
# samba tests rely on this
ENV USER=samba LC_ALL=en_US.utf8 LANG=en_US.utf8