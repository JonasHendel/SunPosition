import React from 'react';
import { useEffect, useState } from 'react/cjs/react.development';

import '../css/app.css';

import SunCalc from 'suncalc';

const AzimuthChart = (props) => {
	// Get time of sunrise and sunset
	const sunrise = SunCalc.getTimes(
		props.date,
		props.latitude,
		props.longitude
	).sunrise;
	const sunset = SunCalc.getTimes(props.date, props.latitude, props.longitude)
		.sunset;

	// Get Azimuth for sunrise and sunset
	const sunriseAzi = SunCalc.getPosition(
		sunrise,
		props.latitude,
		props.longitude
	).azimuth;
	const sunsetAzi = SunCalc.getPosition(
		sunset,
		props.latitude,
		props.longitude
	).azimuth;

	const [y1, setY1] = useState(0);
	const [x1, setX1] = useState(0);
	const [y2, setY2] = useState(0);
	const [x2, setX2] = useState(0);

	useEffect(() => {
		setY1(Math.sin((90 * Math.PI) / 180 + sunriseAzi) * 250 + 300);
		setX1(Math.cos((90 * Math.PI) / 180 + sunriseAzi) * 250 + 400);

		setY2(Math.sin((90 * Math.PI) / 180 + sunsetAzi) * 250 + 300);
		setX2(Math.cos((90 * Math.PI) / 180 + sunsetAzi) * 250 + 400);
	}, [sunsetAzi, sunriseAzi]);

  if(!x2){
    setX2(2)
  }
  if(!x1){
    setX1(2)
  }
  if(!y1){
    setY1(2)
  }
  if(!y2){
    setY2(2)
  }

	const path =
		'M ' +
		x2 +
		' ' +
		y2 +
		' A 250 250 0 1 0 ' +
		x1 +
		' ' +
		y1 +
		' L 400 300 Z';

	return (
		<div className='azichart'>
			<svg className='svg' viewBox='0 0 800 600'>
				<clipPath id='circle'>
            <circle cx='400' cy='300' r='250' />
          </clipPath>
          <g clipPath='url(#circle)'>
            <linearGradient
              id='myGradient'
              gradientTransform='rotate(90)'
            >
              <stop offset='1%' stopColor='gold' />
              <stop offset='100%' stopColor='#ed673b' />
            </linearGradient>
            <circle cx='400' cy='300' r='250' fill='white' />
            <path
              d={path}
              fill='#ed673b'
              stroke='black'
              strokeWidth='7.5'
            />{' '}
            {/* fill='url(#myGradient)' */}
            <circle
              cx='400'
              cy='300'
              r='250'
              strokeWidth='15'
              stroke='black'
              fillOpacity='0'
            />
          </g>
          <g className='text'>
            <text x='383' y='45' fill='black'>
              O
            </text>
            <text x='383' y='593' fill='black'>
              S
            </text>
            <text x='100' y='317' fill='black'>
              W
            </text>
            <text x='650' y='317' fill='black'>
              E
            </text>
          </g>
        </svg>
      </div>
    )
  }

export default AzimuthChart;
