//
//  RoutineDetailView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 6/6/22.
//

import SwiftUI

struct RoutineDetailView: View {
    @Binding var routine:Routine
    @Binding var ActiveRoutine:Routine
    var body: some View {
        List{
            ForEach(Array(routine.exercises.enumerated()), id: \.offset){index, day in
                Section(header: Text("Day " + String(index + 1))){
                    ForEach(day.exercises){ exercise in
                        Text(exercise.name).frame(maxWidth:.infinity, alignment: .leading) .padding(Edge.Set.horizontal, 30)
                    }
                }
            }
        }.frame(maxWidth:.infinity).padding(Edge.Set.horizontal,4).navigationTitle(routine.name).toolbar {
            ToolbarItem(placement: .primaryAction){
                NavigationLink(destination: RoutineEditWrapper(routine: $routine)){Text("Edit")}
            }
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    ActiveRoutine = routine
                }){
                    Text("Select Routine")
                }.disabled(routine == ActiveRoutine)
            }
        }
    }
}

struct RoutineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineDetailView(routine: .constant(Routine.sampleData[0]), ActiveRoutine: .constant(Routine.sampleData[0]) )
    }
}
