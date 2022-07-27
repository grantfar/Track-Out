//
//  Routine.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 5/30/22.
//

import Foundation
class Routine: Identifiable, NSCopying, ObservableObject, Equatable{
    static func == (lhs: Routine, rhs: Routine) -> Bool {
        return lhs.id == rhs.id
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Routine(id:id, name: name, exersises: exercises.map{$0.copy() as! Day})
    }
    
    var id: UUID
    var name: String
    @Published var exercises: [Day]
    
    init(id: UUID = UUID(), name: String ,exersises: [Day] = [Day(exercises: [], index:0)]){
        self.id = id
        self.name = name
        self.exercises = exersises
    }
    
    func MoveDay(originalIndex:Int, destinationIndex:Int){
        self.objectWillChange.send()
        
        exercises.move(fromOffsets: IndexSet(integer: originalIndex), toOffset: destinationIndex > originalIndex ? destinationIndex + 1 : destinationIndex)
        
        // should be fast because there shouldn't be a large ammount of days and this is bug proof
        for i in exercises.indices{
            exercises[i].index = i
        }
        
        
    }
}
extension Routine{
    
    
    static let sampleData: [Routine] =
    [Routine(id: UUID(), name: "4 day", exersises: [
        Day(exercises: {()->[Exercise] in
            var ret:[Exercise] = []
            for _ in 1...4 {
                ret.append(Exercise.sampleData[Int.random(in: 0..<Exercise.sampleData.count)])
            }
            return ret
        }(), index: 0),
        Day(exercises: {()->[Exercise] in
            var ret:[Exercise] = []
            for _ in 1...5 {
                ret.append(Exercise.sampleData[Int.random(in: 0..<Exercise.sampleData.count)])
            }
            return ret
        }(),index: 1),
        Day(exercises: {()->[Exercise] in
            var ret:[Exercise] = []
            for _ in 1...4 {
                ret.append(Exercise.sampleData[Int.random(in: 0..<Exercise.sampleData.count)])
            }
            return ret
        }(),index: 2),
        Day(exercises: {()->[Exercise] in
            var ret:[Exercise] = []
            for _ in 1...3 {
                ret.append(Exercise.sampleData[Int.random(in: 0..<Exercise.sampleData.count)])
            }
            return ret
        }(),index: 3)
    ])]
}
