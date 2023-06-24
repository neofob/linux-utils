#!/usr/bin/env bash

DIRS="blkdev docker misc"

function setup_tscripts()
{
	cd /usr/local/sbin
	for d in $DIRS; do
		ln -s /opt/src/tscripts/$d/*.sh .
	done
}

setup_tscripts
