//
//  DayView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 7/21/22.
//

import SwiftUI

struct DayView: View {
    let dayNum: Int
    let exercises: Day
    @Binding var edit:Int
    @Binding var showSheet:Bool
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Day " + String(dayNum)).font(.title).padding(6).foregroundColor(.white)
                Spacer()
                Button(action: {
                    edit = dayNum - 1
                    showSheet = true
                }) {
                    Label("edit", systemImage:"pencil").foregroundColor(.accentColor)
                }.buttonStyle(.borderedProminent).tint(.white).padding(.trailing, 6)
            }.frame(maxWidth: .infinity).background(Color.secondary).cornerRadius(4).padding(.horizontal,6)
            ForEach(Array(exercises.exercises.enumerated()), id: \.offset){ index, exercise in
                Text(exercise.name).frame(maxWidth:.infinity, alignment: .leading) .padding(Edge.Set.horizontal, 30)
            }
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(dayNum: 1, exercises: Routine.sampleData[0].exercises[0], edit: .constant(0), showSheet: .constant(false))
    }
}
