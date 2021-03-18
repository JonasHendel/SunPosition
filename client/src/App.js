import '../node_modules/react-vis/dist/style.css';
import { React, useState } from 'react';
import DatePicker from 'react-datepicker';
import "react-datepicker/dist/react-datepicker.css";

// CSS
import './css/app.css'

// Components
import AltitudeChart from './components/altitude';
import AzimuthChart from './components/azimuth';

function App() {
	const [address, setAddress] = useState('Oslo');
	const [date, setDate] = useState(new Date());
	const [lat, setLat] = useState();
	const [long, setLong] = useState();

  console.log(date)

	const addressToLatitude = () => {
		const apiUrl =
			'https://api.opencagedata.com/geocode/v1/json?q=' +
			address +
			'&key=a36f7bc238ea498bb701ac8e2f865655';
		fetch(apiUrl)
			.then((resp) => resp.json())
			.then((data) => {
				const lat = data.results[0].geometry.lat;
				const long = data.results[0].geometry.lng;
				setLat(lat);
				setLong(long);
			})
			.catch((error) => console.log(error));
	};

	const [min, setMin] = useState('auto');
	const [max, setMax] = useState('auto');

	const clickHandler = (e) => {
		setMax(e.target.value);
		setMin(-e.target.value);
	};

	const clickHandlerAuto = (e) => {
		setMax(e.target.value);
		setMin(e.target.value);
	};

	return (
		<div className='app'>
			<div className='card'>
				<div className='input-div'>
					<input
						className='input'
            type='text'
						value={address}
            onChange={(e) => {
							setAddress(e.target.value);
              console.log(e.target.value)
						}}
						placeholder='latitude'/>
          <DatePicker type='date' selected={date} onChange={date => setDate(date)}/>
				</div>
				<div className='button-div'>
					<button type='button' onClick={clickHandler} value='60'>
						60
					</button>
					<button type='button' onClick={clickHandler} value='90'>
						90
					</button>
					<button className='btn' type='button' onClick={clickHandlerAuto} value='auto'>
						AUTO
					</button>
					<button
						onClick={() => {
							addressToLatitude();
						}}
					>
						Go!
					</button>
				</div> {lat && (
					<div className='graph'>
						<div className='altchar'>
							<AltitudeChart
								latitude={lat}
								longitude={long}
								date={date}
								max={max}
								min={min}
							/>
						</div>
						<div>
							<AzimuthChart
								latitude={lat}
								longitude={long}
								date={date}
							/>
						</div>
					</div>
				)}
			</div>
		</div>
	);
}

export default App;
