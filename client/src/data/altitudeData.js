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
  
  const calcPos= () => {
    let data = []
    for(let i = 0; i <=24; i++){
      var altitude = SunCalc.getPosition(date.setHours(i, 0, 0), latitude, longitude).altitude * 180 / Math.PI
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