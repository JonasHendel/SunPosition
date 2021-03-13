import SunCalc from "suncalc"

const getSunPos = (date, latitude, longitude) => {
  let dayString = String(date).substring(0,16)

  for(let i = 0; i <24; i++){
    let finalDate = new Date(dayString+i+':00:00 GMT+0100')
    var altitude = SunCalc.getPosition(finalDate, latitude, longitude).altitude * 180 / Math.PI
    console.log(altitude, i)
  }
}


  
const data =  [
  {
    "id": "japan",
    "color": "hsl(231, 70%, 50%)",
    "data": [
      {
        "x": "plane",
        "y": 28
      },
      {
        "x": "helicopter",
        "y": 251
      },
      {
        "x": "boat",
        "y": 231
      },
      {
        "x": "train",
        "y": 161
      },
      {
        "x": "subway",
        "y": 89
      },
      {
        "x": "bus",
        "y": 123
      },
      {
        "x": "car",
        "y": 269
      },
      {
        "x": "moto",
        "y": 0
      },
      {
        "x": "bicycle",
        "y": 239
      },
      {
        "x": "horse",
        "y": 158
      },
      {
        "x": "skateboard",
        "y": 273
      },
      {
        "x": "others",
        "y": 274
      }
    ]
  }
]


export {data, getSunPos }