#!/usr/bin/env bash

# Docs for getting token https://developers.meethue.com/documentation/getting-started
# Possible Light States https://github.com/sqmk/huejay#lights

# Detects Bridge IP automatically
bridgeIP=$(curl -s https://discovery.meethue.com | cut -d: -f3 | tr -d '"}]')

# REQUIRED - Get your own token, see link at the top
# Example Token
userToken="8BGXPDAKtXVoBdlDlrauoPJP-6JFENcEq4m6F05t"

getLightsInfo(){
  # Get all light attributes
  curl http://$bridgeIP/api/$userToken/lights/
}

# My Light ID's, yours will differ. Call getLightsInfo()
lights=(3 4 5)

getLightStatus(){
  curl http://$bridgeIP/api/$userToken/lights/$2
}

getAllLightStatus(){
  # Get individual attributes
  for i in ${lights[@]}
  do
    curl http://$bridgeIP/api/$userToken/lights/$i
  done
}

lightOn(){
  # Turn on/change brightness single light
  curl -H 'Content-Type: application/json' -X PUT -d '{"on":true, "bri":200}' http://$bridgeIP/api/$userToken/lights/$2/state
}

lightOff(){
  # Turn off single light
  curl -H 'Content-Type: application/json' -X PUT -d '{"on":false}' http://$bridgeIP/api/$userToken/lights/$2/state
}

lightsOn(){
  for i in ${lights[@]}
  do
    curl -H 'Content-Type: application/json' -X PUT -d '{"on":true, "bri":200}' http://$bridgeIP/api/$userToken/lights/$i/state
  done
}

lightsOff(){
  for i in ${lights[@]}
  do
    curl -H 'Content-Type: application/json' -X PUT -d '{"on":false}' http://$bridgeIP/api/$userToken/lights/$i/state
  done
}

# Call Function
$1
