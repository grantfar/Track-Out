//
//  RoutineView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 5/30/22.
//

import SwiftUI

struct RoutineView: View {
    @Binding var ExistingRoutines: [Routine]
    @Binding var ActiveRoutine:Routine
    @State var newRoutine = Routine(name: "New Routine")
    @State var ShowingEdit = false
    var body: some View {
        NavigationLink(isActive: $ShowingEdit, destination: {RoutineAddWrapper(newRoutine: $newRoutine, ExistingRoutines: $ExistingRoutines)}, label: {EmptyView()})
        List{
            ForEach($ExistingRoutines){ $ERoutine in
                NavigationLink(destination: RoutineDetailView(routine: $ERoutine, ActiveRoutine: $ActiveRoutine)){
                    RoutineCardView(label: ERoutine.name, count: ERoutine.exercises.count)
                }
            }
        }.navigationTitle("Routines").toolbar {
            Button(action: {
                newRoutine = Routine(name: "New Routine")
                ShowingEdit = true
            }){
                Image(systemName: "plus")
            }
        }
    }
}

//struct RoutineView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoutineView(ExistingRoutines: .constant(Routine.sampleData),ActiveRoutine: .constant(Routine.sampleData[0]))
//    }
//}
