//
//  ContentView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var ExistingRoutines: [Routine]
    @Binding var ActiveRoutine:Routine
    var body: some View {
        TabView{
            WorkoutView(Routines: $ExistingRoutines, ActiveRoutine: $ActiveRoutine).tabItem{
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
        ContentView(ExistingRoutines: .constant(Routine.sampleData), ActiveRoutine: .constant(Routine.sampleData[0]))
    }
}
