//
//  SunUrl.swift
//  SunPosMacTest
//
//  Created by Jonas Hendel on 26/01/2021.
//

import SwiftUI

struct SunUrl: View {
    
    @EnvironmentObject var value1: ViewModel
    
    var SunRise: Array<String>
    
    func SrMinute() -> String {
        let timeFraction = SunRise[4]
        
        guard let leftRange = timeFraction.range(of: ".") else {
            return "cant find the left range"
        }
        
        let stringMinuteFraction = "0\(timeFraction[leftRange.lowerBound...])"
        
        let minuteFraction = Double(stringMinuteFraction) ?? 0
        
        let minute12 = minuteFraction * 60
        
        
        return String(Int(floor(minute12)))
    }
    
    func SrHour() -> String {
        let timeFraction = SunRise[4]
        
        let first2 = timeFraction.prefix(2)
        
        let hour = first2.replacingOccurrences(of: ".", with: "")
        
        return String(hour)
    }
    
    var SunSet: Array<String>
    
    func SsMinute() -> String {
        let timeFraction = SunSet[4]
        
        guard let leftRange = timeFraction.range(of: ".") else {
            return "cant find the left range"
        }
        
        let stringMinuteFraction = "0\(timeFraction[leftRange.lowerBound...])"
        
        let minuteFraction = Double(stringMinuteFraction) ?? 0
        
        let minute12 = minuteFraction * 60.0
        
        return String(Int(floor(minute12)))
    }
    
    func SsHour() -> String {
        let timeFraction = SunSet[4]
        
        let first2 = timeFraction.prefix(2)
        
        let hour = first2.replacingOccurrences(of: ".", with: "")
        
        return String(hour)
    }
    
    var body: some View {
        let circlestroke = Circle().fill()
        
        ZStack{
            circlestroke.frame(width: 283, height: 283, alignment: .center).position(x: 266.4, y: 0).shadow(radius: 10)
            azimuthFunction(SrUrl: URL(string: "https://midcdmz.nrel.gov/apps/spa.pl?syear=\(value1.year)&smonth=\(value1.month)&sday=\(value1.day)&eyear=\(value1.year)&emonth=\(value1.month)&eday=\(value1.day)&step=10&stepunit=1&otype=1&hr=\(SrHour())&min=\(SrMinute())&sec=0&latitude=\(value1.latitude)&longitude=\(value1.longitude)&timezone=\(value1.offset)&elev=53&press=835&temp=10&dut1=0.0&deltat=64.797&azmrot=180&slope=0&refract=0.5667&field=1"), SsUrl: URL(string: "https://midcdmz.nrel.gov/apps/spa.pl?syear=\(value1.year)&smonth=\(value1.month)&sday=\(value1.day)&eyear=\(value1.year)&emonth=\(value1.month)&eday=\(value1.day)&step=10&stepunit=1&otype=1&hr=\(SsHour())&min=\(SsMinute())&sec=0&latitude=\(value1.latitude)&longitude=\(value1.longitude)&timezone=\(value1.offset)&elev=53&press=835&temp=10&dut1=0.0&deltat=64.797&azmrot=180&slope=0&refract=0.5667&field=1")).fill(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .bottom , endPoint: .top))
            azimuthFunction(SrUrl: URL(string: "https://midcdmz.nrel.gov/apps/spa.pl?syear=\(value1.year)&smonth=\(value1.month)&sday=\(value1.day)&eyear=\(value1.year)&emonth=\(value1.month)&eday=\(value1.day)&step=10&stepunit=1&otype=1&hr=\(SrHour())&min=\(SrMinute())&sec=0&latitude=\(value1.latitude)&longitude=\(value1.longitude)&timezone=\(value1.offset)&elev=53&press=835&temp=10&dut1=0.0&deltat=64.797&azmrot=180&slope=0&refract=0.5667&field=1"), SsUrl: URL(string: "https://midcdmz.nrel.gov/apps/spa.pl?syear=\(value1.year)&smonth=\(value1.month)&sday=\(value1.day)&eyear=\(value1.year)&emonth=\(value1.month)&eday=\(value1.day)&step=10&stepunit=1&otype=1&hr=\(SsHour())&min=\(SsMinute())&sec=0&latitude=\(value1.latitude)&longitude=\(value1.longitude)&timezone=\(value1.offset)&elev=53&press=835&temp=10&dut1=0.0&deltat=64.797&azmrot=180&slope=0&refract=0.5667&field=1")).stroke(lineWidth: 4.0).shadow(radius: 10)
        }
    }
}

//struct SunUrl_Previews: PreviewProvider {
//    static var previews: some View {
//        SunUrl()
//    }
//}
