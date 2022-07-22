//
//  Routine.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 5/30/22.
//

import Foundation
class Routine: Identifiable, NSCopying{
    func copy(with zone: NSZone? = nil) -> Any {
        return Routine(id:id, name: name, exersises: exercises.map{$0.copy() as! Day})
    }
    
    var id: UUID
    var name: String
    var exercises: [Day]
    
    init(id: UUID, name: String ,exersises: [Day] = [Day(exercises: [], index:0)]){
        self.id = id
        self.name = name
        self.exercises = exersises
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
