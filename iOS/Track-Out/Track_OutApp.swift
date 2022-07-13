//
//  Track_OutApp.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 4/27/22.
//

import SwiftUI

@main
struct Track_OutApp: App {
    @State var ExistingRoutines: [Routine] = Routine.sampleData
    var body: some Scene {
        WindowGroup {
            ContentView(ExistingRoutines: $ExistingRoutines)
        }
    }
}
