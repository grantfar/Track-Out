//
//  RoutineDetailView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 6/6/22.
//

import SwiftUI

struct RoutineDetailView: View {
    @Binding var routine:Routine
    @State var showingEdit:Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){

            ForEach(Array(routine.exercises.enumerated()), id: \.offset){index, day in
                Section(header:Text("Day " + String(index + 1)).font(.title).frame(maxWidth: .infinity).padding(6).background(Color.secondary).cornerRadius(4).foregroundColor(.white)){
                    Spacer()
                    VStack(alignment: .leading){
                        ForEach(day){ exercise in
                            Text(exercise.name).frame(maxWidth:.infinity, alignment: .leading) .padding(Edge.Set.horizontal, 30)
                        }
                    }
                }
                Spacer()
            }
        }.frame(maxWidth:.infinity).padding(Edge.Set.horizontal,4).navigationTitle(routine.name).toolbar {
            ToolbarItem(placement: .primaryAction){
                Button(action:{showingEdit = true}){Text("Edit")}
            }
        }.sheet(isPresented: $showingEdit){
            NavigationView{
                RoutineEditView().toolbar {
                    ToolbarItem(placement: .confirmationAction){
                        Button(action: {
                            showingEdit = false
                        }){
                            Text("Save")
                        }
                    }
                    ToolbarItem(placement: .cancellationAction){
                        Button(action: {
                            showingEdit = false
                        }){
                            Text("Cancel")
                        }
                    }
                }
            }
        }
    }
}

struct RoutineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineDetailView(routine: .constant(Routine.sampleData[0]))
    }
}
