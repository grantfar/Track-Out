//
//  DayEditView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 7/26/22.
//

import SwiftUI



struct DayEditView: View {
    @ObservedObject var day:Day
    @State var add:Exercise? = nil
    var body: some View {
        VStack{
            List{
                ForEach(Array(zip(day.exercises.indices, day.exercises)), id: \.1){index, exercise in
                    HStack{
                        Picker("Exercise " + String(index + 1) , selection: $day.exercises[index]){
                            ForEach(Exercise.sampleData){e in
                                Text(e.name).tag(e)
                            }
                        }
                        Spacer()
                        Button(action: {
                            day.exercises.remove(at: index)
                        }){
                            Image(systemName: "trash")
                        }.buttonStyle(.bordered).tint(.accentColor)
                    }.pickerStyle(.menu)

                }
            }
            Picker("Exercise " , selection: $add){
                Text("Add Exercise").tag(nil as Exercise?)
                ForEach(Exercise.sampleData){e in
                    Text(e.name).tag(e as Exercise?)
                }
            }.padding(6).onChange(of: add, perform: { _ in
                if let addWrap = add {
                    day.exercises.append(addWrap)
                    add = nil as Exercise?
                }
            })
        }
    }
}

struct DayEditView_Previews: PreviewProvider {
    static var previews: some View {
        DayEditView(day:Routine.sampleData[0].exercises[0])
    }
}
