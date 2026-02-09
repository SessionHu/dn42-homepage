#!/bin/sh
set -x
WD=`dirname $0`
LIQ="$WD/radio.liq"
. $WD/../.rc
while true; do
  liquidsoap $LIQ
done
