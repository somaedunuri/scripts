QDDTS=/vws/aak/qddts
export QDDTS

if [ "-$QDDTS" = "-" ]; then
    echo "QDDTS environmental variable not set"         >&2
    exit 1
else
    . $QDDTS/lib/sh_init
fi


query.pl						\
        Project:CSC.sys and Status:AOINPW and Version:12.0S

