//
//  getSunData.swift
//  SunPosMacTest
//
//  Created by Jonas Hendel on 26/01/2021.
//

import SwiftUI

private func loadData(from url: URL?) -> Array<String> {

    guard let url = url else {
        return ["NilElevation"]
    }

    let html = try! String(contentsOf: url, encoding: String.Encoding.utf8)
    
    let parsedCSV = html.components(
        separatedBy: ","
    ).map{ $0.components(separatedBy: "\n")[0] }

    return parsedCSV
}

struct getSunData: View {
    
    var urlSunRise: URL?
    
    var urlSunSet: URL?
    
    var SriArray: Array<String> { loadData(from: urlSunRise) }
    
    var SseArray: Array<String> { loadData(from: urlSunSet) }
    
    var body: some View {
        SunUrl(SunRise: SriArray, SunSet: SseArray) 
    }
}

struct getSunData_Previews: PreviewProvider {
    static var previews: some View {
        getSunData()
    }
}
