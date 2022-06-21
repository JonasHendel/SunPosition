//
//  Sun_PositionApp.swift
//  Sun Position
//
//  Created by Jonas Hendel on 26/01/2021.
//

import SwiftUI

@main
struct Sun_PositionApp: App {
    @StateObject var text1 = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(text1)
        }
    }
}
