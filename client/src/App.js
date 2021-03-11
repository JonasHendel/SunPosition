import './App.css';
import '../node_modules/react-vis/dist/style.css';
import {React, useState, useEffect} from 'react'


// Components
import AltitudeChart from './components/altitude';

//Functions
import {calc} from './data/altitudeData'



function App() {

  const [lat, setLat] = useState(4)

  calc(lat, 5)

  // useEffect whenever input is changed => reload Graph


  return (
    <div className='App'>
      <input value={lat} onChange={(e) => {setLat(e.target.value); console.log(e)}} placeholder='latitude'></input>
      
      <input placeholder='longitude'></input>
      <input type='date'></input>

        <div style={{height:500}}>
          <AltitudeChart/>
        </div>

    </div>
  );
}

export default App;
