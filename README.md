# hue-lights-controller

Bash Script for playing with Phillips Hue lights

## But why? There's an app for that.
Custom Automation? I don't know, [be creative](#mail-yourself-the-status-of-your-lights-while-youre-away)....

## Prerequisites
1) Get your own Phllips Hue API User Token by following docs [here](https://developers.meethue.com/documentation/getting-started)

2) Update lights array in the script with your lightID's by:
      1) First, add your user token in the script (line 11)
      2) `./hue.sh getLightsInfo | python -m json.tool`
      
#### Example Output(3 is the Light ID):

```
{
    "3": {
        "manufacturername": "Philips",
        "modelid": "LTW004",
        "name": "lamp",
        "state": {
            "alert": "none",
            "bri": 200,
            "colormode": "ct",
            "ct": 443,
            "on": false,
            "reachable": true
        },
        "swupdate": {
            "lastinstall": null,
            "state": "noupdates"
        },
        "swversion": "5.50.1.19085",
        "type": "Color temperature light",
        "uniqueid": "00:17:88:01:02:05:74:f6-0b"
    },
```

# Usage

### Get All Lights Info

```
./hue.sh getLightsInfo
```

### Get Single Light Status

"1" being the light ID

```
./hue.sh getLightStatus 1
```

### Get All Light Status

```
./hue.sh getAllLightStatus
```

### Turn on Single Light
"1" being the light ID

```
./hue.sh lightOn 1
```
### Turn off Single Light
"1" being the light ID

```
./hue.sh lightOff 1
```

### Turn on All Lights

```
./hue.sh lightsOn
```

### Turn off All Lights

```
./hue.sh lightsOff
```

### Mail yourself the status of your lights while you're away

```
./hue.sh getAllLightStatus | mail -s “Kids Are Running Up Electric Bill” you@youremailid.com
```

## [More API Docs](https://developers.meethue.com/documentation/core-concepts)
