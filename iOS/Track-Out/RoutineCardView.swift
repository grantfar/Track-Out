//
//  RoutineCardView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 6/2/22.
//

import SwiftUI

struct RoutineCardView: View {
    let label:String
    let count:Int
    var body: some View {
        HStack{
            Text(label).padding(4)
            Spacer()
            Text(Int.formatted(count)() + " Work Outs" )
        }
    }
}

struct RoutineCardView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineCardView(label: "test", count: 3)
    }
}
