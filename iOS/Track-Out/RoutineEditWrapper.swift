//
//  RoutineEditWrapper.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 7/26/22.
//

import SwiftUI

struct RoutineEditWrapper: View {
    @Environment(\.dismiss) var dismiss
    @State var editRoutine:Routine
    @Binding var saveRoutine:Routine
    
    init(routine:Binding<Routine>){
        _saveRoutine = routine
        _editRoutine = State(initialValue:routine.wrappedValue.copy() as! Routine)
    }
    var body: some View {
        VStack{
            RoutineEditView(EditRoutine: $editRoutine)
        }.toolbar{
            ToolbarItem(placement:.confirmationAction){
                Button(action: {
                    saveRoutine = editRoutine
                    dismiss()
                }, label: {Text("Save")})
            }
        }
    }
}

