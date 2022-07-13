//
//  ExcersiceView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 6/12/22.
//

import SwiftUI

struct ExcersiceView: View {
    @Binding var workout:Workout
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ExcersiceView_Previews: PreviewProvider {
    static var previews: some View {
        ExcersiceView(workout:.constant(Workout(routine:Routine.sampleData[0],index: 0)))
    }
}
