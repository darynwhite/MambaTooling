#!/bin/bash
[ -z "$1" ] && { echo 'Missing the port list file argument!'; exit 1; }
DIR="$( dirname "${BASH_SOURCE[0]}" )"
source $DIR/setup.sh

## read input file from descriptor 5
exec 5<$1

## Install minimum port list
while read -u 5 p; do \
  p=($p)
  if echo "$p" | egrep -q -v '^[[:space:]]*$'; then \
    if echo "$p" | egrep -q -v '^[[:space:]]*#'; then \
      echo "package=\"${p[*]}\""
      if [ "${#p[@]}" == "1" ]; then \
        conda install -y ${p[0]} || break
      else
        conda install -y -c ${p[1]} ${p[0]} || break
      fi
      Ping
    fi
  fi
done
Submarine
