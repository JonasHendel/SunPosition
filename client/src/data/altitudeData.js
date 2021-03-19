import SunCalc from "suncalc"


const getAltitude = (date, latitude, longitude) => {
  class Data{
    constructor(i, a){
      this.x=i
      this.y=a
    }
    data() {
      return {
        data:
        {x:this.x, y:this.y}
      }
    }
  }
  
  let dayString = String(date).substring(0,16)
  const calcPos= () => {
    let data = []
    for(let i = 0; i<24; i++){
      let finalDate = new Date(dayString+i+':00:00 GMT+0100')
      var altitude = SunCalc.getPosition(finalDate, latitude, longitude).altitude * 180 / Math.PI
      let temp = new Data(i, altitude)
      data.push(temp.data().data)
    }
    return data
  }
  
  var dataObj = [
    {
      id: 'Altitude',
      color: 'hsl(39, 100%, 50%)',
      data: calcPos(),
    },
  ]
  return dataObj
}

export {getAltitude}