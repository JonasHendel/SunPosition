//
//  elevationGraph.swift
//  testMac
//
//  Created by Jonas Hendel on 18/01/2021.
//

import SwiftUI
import WebKit

private func loadData(from url: URL?) -> Array<String> {

    guard let url = url else {
        return ["NilElevation"]
    }

    let html = try! String(contentsOf: url, encoding: String.Encoding.utf8)
    
    let parsedCSV = html.components(
        separatedBy: "00:00,"
    ).map{ $0.components(separatedBy: "\n")[0] }

    return parsedCSV
}

//private func getHtml() -> Array<String> {
//    let url1 = elevationFunction().url1
//
//    var html2: Array<String> { loadData(from: url1) }
//
//    return html2
//}

struct elevationFunction: Shape {
    
    var url1: URL?
    var html2: Array<String> { loadData(from: url1) }

    func path(in rect: CGRect) -> Path {
        
        print(url1)
        
        var html3 = html2

        var path = Path()
        path.move(to: CGPoint(x: 106.4, y: (189.6 - (90-Double(html3[1])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 1 , y: (189.6 - (90-Double(html3[2])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 2, y: (189.6 - (90-Double(html3[3])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 3, y: (189.6 - (90-Double(html3[4])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 4, y: (189.6 - (90-Double(html3[5])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 5, y: (189.6 - (90-Double(html3[6])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 6, y: (189.6 - (90-Double(html3[7])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 7, y: (189.6 - (90-Double(html3[8])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 8, y: (189.6 - (90-Double(html3[9])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 9, y: (189.6 - (90-Double(html3[10])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 10, y: (189.6 - (90-Double(html3[11])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 11, y: (189.6 - (90-Double(html3[12])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 12, y: (189.6 - (90-Double(html3[13])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 13, y: (189.6 - (90-Double(html3[14])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 14, y: (189.6 - (90-Double(html3[15])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 15, y: (189.6 - (90-Double(html3[16])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 16, y: (189.6 - (90-Double(html3[17])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 17, y: (189.6 - (90-Double(html3[18])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 18, y: (189.6 - (90-Double(html3[19])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 19, y: (189.6 - (90-Double(html3[20])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 20, y: (189.6 - (90-Double(html3[21])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 21, y: (189.6 - (90-Double(html3[22])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 22, y: (189.6 - (90-Double(html3[23])!)*1.6)))
        path.addLine(to: CGPoint(x: 106.4 + 320/23 * 23, y: (189.6 - (90-Double(html3[24])!)*1.6)))
    
        return path


    }
}

struct elevationLegend: Shape {
    func path(in rect: CGRect) -> Path {

        var path = Path()

        path.move(to: CGPoint(x: 106.4, y: (189.6 - (90-0) * 1.6)))
        path.addLine(to: CGPoint(x: 106.4, y: (189.6 - (90-180) * 1.6)))



        path.move(to: CGPoint(x: 106.4, y: (189.6 - (90-90.0))))
        path.addLine(to: CGPoint(x: 426.4, y: (189.6 - (90-90.0))))


        return path

    }
}


struct elevationGraph: View {
    var body: some View {
        Text("Placeholder")
    }
}




