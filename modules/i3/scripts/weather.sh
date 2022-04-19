#!/bin/bash

curl -L https://api.weather.gov/gridpoints/BOI/128,85/forecast 2> /dev/null | \
  jq ".properties.periods[0].temperature" --raw-output
