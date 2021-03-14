import './App.css';
import '../node_modules/react-vis/dist/style.css';
import {React, useState, useEffect} from 'react'
import DatePicker from 'react-date-picker'
import './Calendar.css'
import './DatePicker.css'


// Components
import AltitudeChart from './components/altitude';

//Functions

function App() {

  const [latitude, setLat] = useState(59.911491)
  const [longitude, setLong] = useState(10.757933)
  const [date, setDate] = useState(new Date())

  return (
    <div className='App'>
      <div className='input-div'>
        <input className='input' value={latitude} onChange={(e) => {setLat(e.target.value)}} placeholder='latitude'></input>
        <input className='input' value={longitude} onChange={(e) => {setLong(e.target.value)}}  placeholder='longitude'></input>
        <DatePicker onChange={setDate} value={date}></DatePicker>
      </div>
      <div style={{height:500}}>
        <AltitudeChart latitude={latitude} longitude={longitude} date={date}/>
      </div>
    </div>
  );
}

export default App;
