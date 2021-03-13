import './App.css';
import '../node_modules/react-vis/dist/style.css';
import {React, useState, useEffect} from 'react'
import DatePicker from 'react-date-picker'
import './Calendar.css'

// Components
import AltitudeChart from './components/altitude';

//Functions
import {getSunPos} from './data/altitudeData'



function App() {

  const [lat, setLat] = useState(4)
  const [date, setDate] = useState(new Date())

  // useEffect whenever input is changed => reload Graph

  getSunPos(date)

  return (
    <div className='App'>
      <input value={lat} onChange={(e) => {setLat(e.target.value)}} placeholder='latitude'></input>
      
      <input placeholder='longitude'></input>
      <div className='date_picker'>
        <DatePicker onChange={setDate} value={date}></DatePicker>
      </div>

        <div style={{height:500}}>
          <AltitudeChart/>
        </div>

    </div>
  );
}

export default App;
