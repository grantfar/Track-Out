//
//  RoutineAddWrapper.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 7/26/22.
//

import SwiftUI

struct RoutineAddWrapper: View {
    @Environment(\.dismiss) var dismiss
    @Binding var newRoutine:Routine
    @Binding var ExistingRoutines:[Routine]
    var body: some View {
        HStack{
            RoutineEditView(EditRoutine: $newRoutine)
        }.toolbar{
            ToolbarItem(placement:.confirmationAction){
                Button(action: {
                    ExistingRoutines.append(newRoutine)
                    dismiss()
                }, label: {Text("Save")})
            }
        }
    }
}
