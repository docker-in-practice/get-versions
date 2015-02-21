#!/bin/bash

set -e

for c in apt-get apt-cache
do
	if [ $(which $c | wc -c) = 0 ]
	then
		echo "Could not find ${c} command on path. Is this a debian-based distro?"
		exit 1
	fi
done

PKG=${1:?"please supply package name"}

apt-get install -y -q $PKG > /dev/null 2>&1

cat <(apt-cache --recurse --no-pre-depends --no-recommends --no-suggests --no-enhances --no-conflicts --no-breaks --no-replaces depends $PKG) <(echo $PKG) | grep "^[a-z]" | xargs apt-cache show | grep ^Package | sed 's/^Package: \(.*\)/dpkg -l \1 | grep ^ii | awk "{print \\$2,\\$3}"/g' | sh 2>/dev/null | sed 's/\(.*\) \(.*\)/\1=\2/' | tr '\n' ' ' | sed 's/^/RUN apt-get install -y /g'

echo ""

