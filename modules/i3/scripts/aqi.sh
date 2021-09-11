#!/bin/bash

curl "https://airquality.deq.idaho.gov/ajax/getAllStations/?TargetIds=&withActive=True&_=$(date +%s)000" \
  -H "Accept: application/json" \
  -H "Accept-Language: en-US,en;q=0.9" \
  --compressed 2> /dev/null | \
  jq ".[] | select(.serialCode == 108).IndexValue" --raw-output
