#!/bin/sh
. `dirname $0`/../.rc
F=`mktemp`
find $MUSIC_DIR -follow -type f -name '[!.]*' -exec realpath --relative-to=$MUSIC_DIR {} + | shuf > $F
#printf "${SERVER_PROTOCOL} 200 OK\r\n"
printf 'content-type: text/plain; charset=utf-8\r\n'
printf "content-length: $(stat -c %s $F)\r\n"
printf '\r\n'
cat $F
rm $F
