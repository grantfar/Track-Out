//
//  ExerciseView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 5/3/22.
//

import SwiftUI

struct WorkoutView: View {
    
    struct PrimaryButton:ButtonStyle{
        func makeBody(configuration: Configuration) -> some View {
            configuration.label.padding(8).foregroundColor(.white)
                .frame(maxWidth: .infinity).padding(.horizontal).background(.blue).cornerRadius(5)
        }
    }
    
    struct SecondaryButton:ButtonStyle{
        func makeBody(configuration: Configuration) -> some View {
            configuration.label.padding(8).foregroundColor(.white)
                .frame(maxWidth: .infinity).padding(.horizontal).background(.gray).cornerRadius(5)
        }
    }
    
    
    @Binding var Routines:[Routine]
    @Binding var ActiveRoutine:Routine
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination:EmptyView()){
                    Label("Next Session", systemImage: "play.fill")
                }.buttonStyle(PrimaryButton())
                
                NavigationLink(destination:EmptyView()){
                    Text("Resume Workout")
                }.buttonStyle(SecondaryButton())
                
                NavigationLink(destination:RoutineView(ExistingRoutines:$Routines, ActiveRoutine: $ActiveRoutine)){
                    Text("Change/Edit Regiments")
                }.buttonStyle(SecondaryButton())
                
                NavigationLink(destination:EmptyView()){
                    Text("Change Workout")
                }.buttonStyle(SecondaryButton())
                
                NavigationLink(destination:EmptyView()){
                    Text("Edit Excercises")
                }.buttonStyle(SecondaryButton())
                
            }.fixedSize(horizontal:true, vertical: false)
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(Routines: .constant(Routine.sampleData), ActiveRoutine: .constant(Routine.sampleData[0]))
    }
}
