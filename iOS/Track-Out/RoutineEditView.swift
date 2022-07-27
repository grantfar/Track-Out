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
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func dropEntered(info: DropInfo) {
        if dropIndex != startIndex{
                routine.MoveDay(originalIndex: startIndex, destinationIndex: dropIndex)
        }
    }
    
    let dropIndex:Int
    let startIndex: Int
    @ObservedObject var routine : Routine
    
}

struct RoutineEditView: View {
    @State var draggedSection:Int
    @ObservedObject var routine:Routine
    @State var edit:Int
    @State var showSheet:Bool = false
    init(EditRoutine:Binding<Routine>) {
        _edit = State(initialValue: 0)
        self._draggedSection = State(initialValue: 0)
        self._routine = ObservedObject(wrappedValue: EditRoutine.wrappedValue)
    }
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack{
                TextField(
                    "Routine Name",
                    text:$routine.name
                ).padding(4)
                
                ForEach(routine.exercises, id:\.id){ day in
                    DayView(dayNum: day.index + 1, exercises: day, edit: $edit, showSheet: $showSheet).onDrop(of: [UTType.text], delegate: SectionDD(dropIndex: day.index, startIndex: draggedSection, routine: routine))
                        .onDrag({self.draggedSection = day.index
                            return NSItemProvider(item: nil, typeIdentifier: "Section")
                        })
                    Spacer()
                }.sheet(isPresented: $showSheet) {
                    DayEditView(day: routine.exercises[edit])
                }
                    
            }.textFieldStyle(.roundedBorder)
        }
    }
    
}

//struct RoutineEditView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        RoutineEditView(EditRoutine:.constant(Routine.sampleData[0]),dismissAction: nil)
//    }
//}
