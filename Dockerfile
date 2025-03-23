FROM ubuntu:24.04
LABEL maintainer "tuan t. pham" <tuan@vt.edu>

ENV PKGS="ca-certificates coreutils curl git gzip make openssh-client pigz pv tar unzip xz-utils bc" \
	DEBIAN_FRONTEND=noninteractive

ENV REPO=https://github.com/neofob/tscripts

RUN apt-get -yq update && \
	apt-get dist-upgrade -yq && \
	apt-get -yq install --no-install-recommends  ${PKGS}

# Ubuntu:23.04 image has an user with uid:gid 1000:1000

RUN apt-get autoremove -yq \
    && apt-get autoclean \
    && rm -fr /tmp/* /var/lib/apt/lists/*

COPY ./setup_links.sh /
RUN mkdir -p /opt/src && cd /opt/src && \
	git clone $REPO tscripts && \
	/setup_links.sh
