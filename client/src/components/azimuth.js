import React from 'react'
import { useEffect, useState } from 'react/cjs/react.development'

import SunCalc from 'suncalc'

const AzimuthChart = (props) => {
  // Get time of sunrise and sunset
  const sunrise = SunCalc.getTimes(props.date, props.latitude, props.longitude).sunrise
  const sunset = SunCalc.getTimes(props.date, props.latitude, props.longitude).sunset

  // Get Azimuth for sunrise and sunset  
  const sunriseAzi = SunCalc.getPosition(sunrise, props.latitude, props.longitude).azimuth
  const sunsetAzi = SunCalc.getPosition(sunset, props.latitude, props.longitude).azimuth

  const [y1, setY1] = useState(0)
  const [x1, setX1] = useState(0)
  const [y2, setY2] = useState(0)
  const [x2, setX2] = useState(0)

  useEffect(()=>{
    setY1(Math.sin(90 * Math.PI / 180 + sunriseAzi)*50 + 200)
    setX1(Math.cos(90 * Math.PI /180 + sunriseAzi)*50 + 400)
  
    setY2(Math.sin(90 * Math.PI / 180 + sunsetAzi)*50 + 200)
    setX2(Math.cos(90 * Math.PI /180 + sunsetAzi)*50 + 400)
  })

  const path = 'M '+x2+' '+y2+' A 50 50 0 1 0 '+x1+' '+y1+' L 400 200 Z'
  return (
    <div className="App">
      <svg preserveAspectRatio="xMidYMin" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 400">
      <clipPath id='circle'>
          <circle cx="400" cy="200" r="50"/>
      </clipPath>
        <g clipPath='url(#circle)'> 
          <circle cx="400" cy="200" r="50"/>
          <path d={path} fill='red'/>
        </g>
      </svg>
      
    </div>
  )
} 

export default AzimuthChart