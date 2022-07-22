//
//  RoutineDetailView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 6/6/22.
//

import SwiftUI

struct RoutineDetailView: View {
    @Binding var routine:Routine
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){

            ForEach(Array(routine.exercises.enumerated()), id: \.offset){index, day in
                Section(header:Text("Day " + String(index + 1)).font(.title).frame(maxWidth: .infinity).padding(6).background(Color.secondary).cornerRadius(4).foregroundColor(.white)){
                    Spacer()
                    VStack(alignment: .leading){
                        ForEach(Array(day.enumerated()), id: \.offset){index,exercise in
                            Text(exercise.name).frame(maxWidth:.infinity, alignment: .leading) .padding(Edge.Set.horizontal, 30)
                        }
                    }
                }
                Spacer()
            }
        }.frame(maxWidth:.infinity).padding(Edge.Set.horizontal,4).navigationTitle(routine.name).toolbar {
            ToolbarItem(placement: .primaryAction){
                NavigationLink(destination: RoutineEditView(EditRoutine: $routine)){Text("Edit")}
            }
        }
    }
}

struct RoutineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineDetailView(routine: .constant(Routine.sampleData[0]))
    }
}
