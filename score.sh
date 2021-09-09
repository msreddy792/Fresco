#!/bin/sh
SCORE=0

if [ -f /projects/challenge/prometheus-*/prometheus.yml ]
then SCORE=$(($SCORE + 20))
fi;

if [ -f /projects/challenge/prometheus-*/prometheus_old.yml ]
then SCORE=$(($SCORE + 20))
fi;

if [ -f /projects/challenge/node_exporter*/node_exporter ]
then SCORE=$(($SCORE + 20))
fi;

(sudo grep -io "8000" /projects/challenge/prometheus-*/prometheus.yml) > /dev/null 2>&1;
if [ $? -eq 0 ]
then SCORE=$(($SCORE + 20))
fi;

(sudo grep -io "localhost" /projects/challenge/prometheus-*/prometheus.yml) > /dev/null 2>&1;if [ $? -eq 0 ]
then SCORE=$(($SCORE + 20))
fi;

echo "FS_SCORE:$SCORE%"