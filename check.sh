#!/bin/sh
pass=0
fail=0

if [ -f /projects/challenge/prometheus-*/prometheus.yml ]
then ((pass++))
else
    ((fail++))
fi;

if [ -f /projects/challenge/prometheus-*/prometheus_old.yml ]
then ((pass++))
else
    ((fail++))
fi;

if [ -f /projects/challenge/node_exporter*/node_exporter ]
then ((pass++))
else
    ((fail++))
fi;

(sudo grep -io "8000" /projects/challenge/prometheus-*/prometheus.yml) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
    ((pass++))
else
    ((fail++))
fi;

(sudo grep -io "localhost" /projects/challenge/prometheus-*/prometheus.yml) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
    ((pass++))
else
    ((fail++))
fi;

echo "Total testcase: 5"
echo "Total testcase passed: $pass"
echo "Total testcase fail: $fail"
echo "total score: $(( ($pass * 100) / 5))"