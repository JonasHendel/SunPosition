//
//  ContentView.swift
//  Sun Position
//
//  Created by Jonas Hendel on 26/01/2021.
//

import SwiftUI

let date = Date()
let calendar = Calendar.current


class ViewModel: ObservableObject {
    @Published var day:String = "\(calendar.component(.day, from: date))"
    @Published var month: String = "\(calendar.component(.month, from: date))" //\(calendar.component(.month, from: date))
    @Published var year: String = "\(calendar.component(.year, from: date))"
    @Published var latitude: String = "59.911491"
    @Published var longitude: String = "10.757933"
    @Published var offset: String = "1.0"
    
    @Published var sunrise: Array<String> = [""]
    
    @Published var page = 0
}



struct ContentView: View {
    @EnvironmentObject var value1: ViewModel
        
    
    var body: some View {
        if value1.page == 0{
            VStack{
                HStack{
                    Text("Day:")
                    TextField("day", text: $value1.day)
                    Text("Month:")
                    TextField("month", text: $value1.month)
                    Text("Year:")
                    TextField("year", text: $value1.year)
                }
                
                
                HStack{
                    Text("Latitude:")
                    TextField("latitude", text: $value1.latitude)
                    Text("Longitude:")
                    TextField("longitude", text: $value1.longitude)
                }
                
                HStack {
                    Text("Offset:")
                    TextField("offset", text: $value1.offset)
                }
                Button(action:{ value1.page = 1}){
                    Text("Show Graph")
                }
            }.frame(width: 300, height: 100, alignment: .center).padding()
        } else {
            ZStack {
                VStack{
                    Button(action:{ value1.page = 0}){
                        Text("Back to input view")
                    }.frame(width: 532.8, height: 50)
                    ZStack{
                        elevationLegend().stroke(lineWidth: 4.0).aspectRatio(contentMode: .fill)
                        elevationFunction(url1: URL(string: "https://midcdmz.nrel.gov/apps/spa.pl?syear=\(value1.year)&smonth=\(value1.month)&sday=\(value1.day)&eyear=\(value1.year)&emonth=\(value1.month)&eday=\(value1.day)&otype=0&step=60&stepunit=1&hr=12&min=0&sec=0&latitude=\(value1.latitude)&longitude=\(value1.longitude)&timezone=\(value1.offset)&elev=53&press=835&temp=10&dut1=0.0&deltat=64.797&azmrot=180&slope=0&refract=0.5667&field=0")).stroke(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .top , endPoint: .bottom), style: StrokeStyle(lineWidth: 6.0)).aspectRatio(contentMode: .fill).shadow(radius: 10)
                    }
                    ZStack {
                        getSunData(urlSunRise: URL(string: "https://midcdmz.nrel.gov/apps/spa.pl?syear=\(value1.year)&smonth=\(value1.month)&sday=\(value1.day)&eyear=\(value1.year)&emonth=\(value1.month)&eday=\(value1.day)&step=10&stepunit=1&hr=12&min=0&sec=0&otype=2&latitude=\(value1.latitude)&longitude=\(value1.longitude)&timezone=\(value1.offset)&elev=53&press=835&temp=10&dut1=0.0&deltat=64.797&azmrot=180&slope=0&refract=0.5667&field=4"), urlSunSet: URL(string: "https://midcdmz.nrel.gov/apps/spa.pl?syear=\(value1.year)&smonth=\(value1.month)&sday=\(value1.day)&eyear=\(value1.year)&emonth=\(value1.month)&eday=\(value1.day)&step=10&stepunit=1&hr=12&min=0&sec=0&otype=2&latitude=\(value1.latitude)&longitude=\(value1.longitude)&timezone=\(value1.offset)&elev=53&press=835&temp=10&dut1=0.0&deltat=64.797&azmrot=180&slope=0&refract=0.5667&field=6"))
                    }
                }
                GraphText()
                
                Text("Sun elevation for latitude: \(value1.latitude), longitude: \(value1.longitude) on \(value1.day)/\(value1.month)/\(value1.year)").position(x: 266.4, y: 70).font(.custom("MerriweatherSans-Regular", size: 10))
                Text("Sun azimuth for latitude: \(value1.latitude), longitude: \(value1.longitude) on \(value1.day)/\(value1.month)/\(value1.year)").position(x: 266.4, y: 420).font(.custom("MerriweatherSans-Regular", size: 10))
                Text("24").position(x: 425.6, y: 245.2+15).font(.custom("MerriweatherSans-Regular", size: 10))
                Text("12").position(x: 266.4, y: 245.2+15).font(.custom("MerriweatherSans-Regular", size: 10))
                Text("6").position(x: 186.4, y: 245.2+15).font(.custom("MerriweatherSans-Regular", size: 10))
                Text("18").position(x: 345.6, y: 245.2+15).font(.custom("MerriweatherSans-Regular", size: 10))
            }.frame(width: 532.8, height: 800, alignment: .center)
        }
    }
}
