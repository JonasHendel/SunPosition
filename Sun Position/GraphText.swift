//
//  GraphText.swift
//  SunPosMacTest
//
//  Created by Jonas Hendel on 26/01/2021.
//

import SwiftUI

struct GraphText: View {
    @EnvironmentObject var value1: ViewModel
    
    var body: some View {
        Text("N").position(x: 266.4, y: 10 + 432).font(.custom("MerriweatherSans-Regular", size: 20))
        Text("W").position(x: 112.0, y: 10 + 592.0).font(.custom("MerriweatherSans-Regular", size: 20))
        Text("E").position(x: 420.8, y: 10 + 592.0).font(.custom("MerriweatherSans-Regular", size: 20))
        Text("S").position(x: 266.4, y: 10 + 744.0).font(.custom("MerriweatherSans-Regular", size: 20))
        
        Text("90").position(x: 92.0, y: 103.6).font(.custom("MerriweatherSans-Regular", size: 10))
        Text("45").position(x: 92.0, y: 176.4).font(.custom("MerriweatherSans-Regular", size: 10))
        Text("0").position(x: 92.0, y: 245.2).font(.custom("MerriweatherSans-Regular", size: 10))
        Text("-45").position(x: 92.0, y: 313.2).font(.custom("MerriweatherSans-Regular", size: 10))
        Text("-90").position(x: 92.0, y: 386.0).font(.custom("MerriweatherSans-Regular", size: 10))
    }
}

struct GraphText_Previews: PreviewProvider {
    static var previews: some View {
        GraphText()
    }
}

