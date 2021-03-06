#!/bin/bash
USAGE="Usage:
    $0 <string-length>"

set -e
set -u

if [[ $# -lt 1 ]]; then
    echo "${USAGE}" >&2
    exit 1
fi

LENGTH=$1

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${LENGTH} | head -n 1

