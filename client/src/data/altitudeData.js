import SunCalc from "suncalc"

const getSunPos = (date) => {
  console.log('DatePicker:', date)
  console.log(SunCalc.getPosition(date, 10.757, 59.91).altitude * 180 / Math.PI)
  const dateString = String(date)
  console.log(dateString)
 }

// for(let i = 0; i <24; i++){

// }
  
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