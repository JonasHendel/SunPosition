import { ResponsiveLine } from '@nivo/line';

import React from 'react';
import { getAltitude } from '../data/altitudeData';

const AltitudeChart = (props) => {
  console.log(getAltitude(props.date, props.latitude, props.longitude))
	return (
		<ResponsiveLine
			data={getAltitude(props.date, props.latitude, props.longitude)}
			margin={{ top: 50, right: 60, bottom: 50, left: 60 }}
			xScale={{ type: 'linear' }}
			yScale={{
				type: 'linear',
				min: props.min,
				max: props.max,
				stacked: true,
				reverse: false,
			}}
			yFormat=' >-.2f'
			axisTop={null}
			axisRight={null}
			axisBottom={{
				orient: 'bottom',
				tickSize: 5,
				tickPadding: 5,
				tickRotation: 0,
				legendOffset: 36,
				legendPosition: 'middle',
        stroke:'black'
			}}
			axisLeft={{
				orient: 'left',
				tickSize: 5,
				tickPadding: 5,
				tickRotation: 0,
				legendOffset: -40,
				legendPosition: 'middle',
			}}
			colors='#ed673b'
			lineWidth={5}
			enablePoints={false}
			pointSize={10}
			pointColor={{ theme: 'background' }}
			pointBorderWidth={2}
			pointBorderColor={{ from: 'serieColor' }}
			pointLabelYOffset={-12}
			enableArea={true}
			areaOpacity={0.35}
			useMesh={true}
      enableGridX={true}
      enableGridY={true}
      markers={[
        {
          axis: "y",
          value: 0,
          lineStyle: { stroke: '0413e', strokeWidth: 2 },
        },
        {
          axis: 'x',
          value: 0,
          lineStyle: { stroke: '0413e', strokeWidth: 2}
          

        }
      ]}
      theme={{
        fontFamily: 'Merriweather Sans',
        // axis: {
        //   ticks: {
        //     line: {
        //       stroke: "noneblack"
        //     }
        //   }
        // },
        // grid: {
        //   line: {
        //     stroke: 'green'
        //   }
        // }
      }
      }
		/>
	);
};

export default AltitudeChart;
