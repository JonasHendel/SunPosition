//
//  graph2.swift
//  SunPosMacTest
//
//  Created by Jonas Hendel on 25/01/2021.
//

import SwiftUI
import WebKit

//func loadData(from url: URL?) -> Array<String> {
//
//    
//    guard let url = url else {
//        return ["Nil"]
//    }
//
//    let html = try! String(contentsOf: url, encoding: String.Encoding.utf8)
//    
//    let parsedCSV = html.components(
//        separatedBy: "00:00,"
//    ).map{ $0.components(separatedBy: "\n")[0] }
//
//    return parsedCSV
//}
//
//func getHtml() -> Array<String> {
//    let url = elevationFunction().url1
//    
//    var html2: Array<String> { loadData(from: url1) }
//    
//    return html2
//}

//func getSunriseTime() -> Array<String> {
//
////    var url1 = URL(string: "https://midcdmz.nrel.gov/apps/spa.pl?syear=2020&smonth=1&sday=1&eyear=2020&emonth=1&eday=1&step=10&stepunit=1&hr=12&min=0&sec=0&otype=2&latitude=39.743&longitude=-105.178&timezone=-7.0&elev=1829&press=835&temp=10&dut1=0.0&deltat=64.797&azmrot=180&slope=0&refract=0.5667&field=4")
//
//    func loadData(from url: URL?) -> Array<String> {
//
//        guard let url = url else {
//            return ["NilSr"]
//        }
//
//        let html = try! String(contentsOf: url, encoding: String.Encoding.utf8)
//
//        let parsedCSV = html.components(
//            separatedBy: ","
//        ).map{ $0.components(separatedBy: "\n")[0] }
//
//        return parsedCSV
//    }
//
//    func getHtml() -> Array<String> {
//        let url1 = azimuthFunction().urlSunrise
//
//        var html2: Array<String> { loadData(from: url1) }
//
//        return html2
//    }
//
//    return getHtml()
//
//}

private func loadData(from url: URL?) -> Array<String> {

    guard let url = url else {
        return ["NilSr"]
    }

    let html = try! String(contentsOf: url, encoding: String.Encoding.utf8)

    let parsedCSV = html.components(
        separatedBy: ":00,"
    ).map{ $0.components(separatedBy: "\n")[0] }

    return parsedCSV
}



struct azimuthFunction: Shape {
    
    var SrUrl: URL?
    var SsUrl: URL?
    
    var SrArray: Array<String> { loadData (from: SrUrl) }
    var SsArray: Array<String> { loadData (from: SsUrl) }

    
    
    func path(in rect: CGRect) -> Path {
        print(SrUrl)
        var path = Path()
        
        path.move(to: CGPoint(x: 266.4, y: 0))
        path.addArc(center: .init(x: 266.4, y: 0), radius: 140, startAngle: Angle(degrees: -90 - Double(SrArray[1])!), endAngle: Angle(degrees: -90 - Double(SsArray[1])!), clockwise: true)
        path.addLine(to: CGPoint(x: 266.4, y: 0))
    
    
        return path
        
//        .applying(CGAffineTransform(scaleX: scale, y: scale)).applying(CGAffineTransform(translationX: xOffset, y: yOffset))


    }
}

//
//struct Circle: View {
//    var body: some View {
//
//    }
//}

//struct graph2_Previews: PreviewProvider {
//    static var previews: some View {
//        elevationGraph2()
//    }
//}
