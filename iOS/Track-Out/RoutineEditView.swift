//
//  RoutineEditView.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 6/6/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct SectionDD : DropDelegate{
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    func dropEntered(info: DropInfo) {
        if dropIndex != startIndex{
            withAnimation(.default){
                excercises.move(fromOffsets: IndexSet(integer: startIndex), toOffset: dropIndex > startIndex ? dropIndex + 1 : dropIndex)
                
                // should be fast because there shouldn't be a large ammount of days and this is bug proof
                for i in excercises.indices{
                    excercises[i].index = i
                }
            }
        }
    }
    
    let dropIndex:Int
    let startIndex: Int
    @Binding var excercises : [Day]
    
}

struct RoutineEditView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var EditRoutine:Routine
    @State var draggedSection:Int
    @State var routine:Routine
    
    
    init(EditRoutine:Binding<Routine>) {
        self._EditRoutine = EditRoutine
        self._draggedSection = State(initialValue: 0)
        self._routine = State(initialValue: EditRoutine.wrappedValue.copy() as! Routine)
    }
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack{
                TextField(
                    "Routine Name",
                    text:$routine.name
                ).padding(4)
                ForEach(routine.exercises){ day in
                    DayView(dayNum: day.index, exercises: day).onDrop(of: [UTType.text], delegate: SectionDD(dropIndex: day.index, startIndex: draggedSection, excercises: $routine.exercises))
                        .onDrag({self.draggedSection = day.index
                        return NSItemProvider(item: nil, typeIdentifier: "Section")
                    })
                    Spacer()
                }
            }.textFieldStyle(.roundedBorder)
        }.toolbar{
            ToolbarItem(placement:.confirmationAction){
                Button(action: {
                    EditRoutine = routine
                    dismiss()
                }, label: {Text("Save")})
            }
        }
    }
}

struct RoutineEditView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineEditView(EditRoutine:.constant(Routine.sampleData[0]))
    }
}
