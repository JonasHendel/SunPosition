import '../node_modules/react-vis/dist/style.css';
import {React, useState} from 'react'
import DatePicker from 'react-date-picker'
import { Button } from 'reactstrap'

// CSS
import './css/app.css';
import './css/Calendar.css'
import './css/DatePicker.css'


// Components
import AltitudeChart from './components/altitude';
import AzimuthChart from './components/azimuth'

//Functions

function App() {

  const [latitude, setLat] = useState(59.911491)
  const [longitude, setLong] = useState(10.757933)
  const [date, setDate] = useState(new Date())

  const [min, setMin] = useState('auto')
  const [max, setMax] = useState('auto')
  
  console.log(window.innerHeight)

  const clickHandler = (e) => {
    setMax(e.target.value)
    setMin(-e.target.value)
  }

  const clickHandlerAuto = (e) => {
    setMax(e.target.value)
    setMin(e.target.value)
  }



  return (
    <div className='app'>
      <div className='card'>
        <div className='input-div'>
          <input className='input' value={latitude} onChange={(e) => {setLat(e.target.value)}} placeholder='latitude'></input>
          <input className='input' value={longitude} onChange={(e) => {setLong(e.target.value)}}  placeholder='longitude'></input>
          <DatePicker onChange={setDate} value={date}></DatePicker>
        </div>
        <div className='button-div'>
          <button onClick={clickHandler} value='60'>60</button>
          <button onClick={clickHandler} value='90'>90</button>
          <button onClick={clickHandlerAuto} value='auto'>AUTO</button>
        </div>
        <div className='graph'>
          <div className='altchar'>
            <AltitudeChart latitude={latitude} longitude={longitude} date={date} max={max} min={min}/>
          </div>
          <div>
            <AzimuthChart latitude={latitude} longitude={longitude} date={date}/>
          </div>
        </div>
      </div>
    </div>
  )
}

export default App;
