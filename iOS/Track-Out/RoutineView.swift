//
//  RoutineView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 5/30/22.
//

import SwiftUI

struct RoutineView: View {
    @Binding var ExistingRoutines: [Routine]
    var body: some View {
        List{
            ForEach($ExistingRoutines){ $ERoutine in
                NavigationLink(destination: RoutineDetailView(routine: $ERoutine)){
                    RoutineCardView(label: ERoutine.name, count: ERoutine.exercises.count)
                }
            }
        }.navigationTitle("Routines").toolbar {
            Button(action: {}){
                Image(systemName: "plus")
            }
        }
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView(ExistingRoutines: .constant(Routine.sampleData))
    }
}
