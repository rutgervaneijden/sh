#!/bin/bash
set -x

/usr/sbin/zpool status | /usr/bin/grep "scrub in progress" && exit 1

/usr/bin/pgrep rsync && exit 1

/usr/bin/pgrep tar && exit 1

/usr/bin/who | /usr/bin/grep rutger && exit 1

[[ $(/usr/bin/curl -X GET http://localhost:8096/Sessions -H 'accept: application/json' -H 'Authorization: Mediabrowser Token=0383bfad1e354cadb0e9f6139e907d43' | /usr/bin/jq '.[] | .NowPlayingItem | .Name') != "" ]] && exit 1

/usr/sbin/shutdown
