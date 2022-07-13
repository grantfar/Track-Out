//
//  ContentView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var ExistingRoutines: [Routine]
    var body: some View {
        TabView{
            WorkoutView(Routines: $ExistingRoutines).tabItem{
                Label("Workout", image: "custom.dumbell")
            }
            Text("History").tabItem{
                Label("History", systemImage: "folder")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ExistingRoutines: .constant(Routine.sampleData))
    }
}
