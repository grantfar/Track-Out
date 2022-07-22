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
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Day " + String(dayNum + 1)).font(.title).padding(6).foregroundColor(.white)
                Spacer()
                Button(action: {}) {
                    Image(systemName:"pencil").foregroundColor(Color.white).accentColor(Color.white)
                }.padding(6).background(Color.white.opacity(0.1)).border(Color.white.opacity(0.05), width:2).cornerRadius(4).padding(.horizontal, 6)
            }.frame(maxWidth: .infinity).background(Color.secondary).cornerRadius(4).padding(.horizontal,6)
            ForEach(Array(exercises.exercises.enumerated()), id: \.offset){ index, exercise in
                Text(exercise.name).frame(maxWidth:.infinity, alignment: .leading) .padding(Edge.Set.horizontal, 30)
            }
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(dayNum: 1, exercises: Routine.sampleData[0].exercises[0])
    }
}
