#!/bin/sh
set -x
LIQ="`dirname $0`/radio.liq"
while true; do
  liquidsoap $LIQ
done
