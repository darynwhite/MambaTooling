#!/bin/bash

Ping () { /usr/bin/afplay /System/Library/Sounds/Ping.aiff; }
Submarine () { /usr/bin/afplay /System/Library/Sounds/Submarine.aiff; }

## Set clean path

export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="${HOME}/conda/bin:${PATH}:${HOME}/bin"
