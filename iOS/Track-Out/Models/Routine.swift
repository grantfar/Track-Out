//
//  Routine.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 5/30/22.
//

import Foundation
class Routine: Identifiable{
    var id: UUID
    var name: String
    var exercises: [[Exercise]]
    
    init(id: UUID, name: String ,exersises: [[Exercise]] = [[]]){
        self.id = id
        self.name = name
        self.exercises = exersises
    }
    
}
extension Routine{
    
    
    static let sampleData: [Routine] =
    [Routine(id: UUID(), name: "4 day", exersises: [
        {()->[Exercise] in
            var ret:[Exercise] = []
            for _ in 1...4 {
                ret.append(Exercise.sampleData[Int.random(in: 0..<Exercise.sampleData.count)])
            }
            return ret
        }(),
        {()->[Exercise] in
            var ret:[Exercise] = []
            for _ in 1...5 {
                ret.append(Exercise.sampleData[Int.random(in: 0..<Exercise.sampleData.count)])
            }
            return ret
        }(),
        {()->[Exercise] in
            var ret:[Exercise] = []
            for _ in 1...4 {
                ret.append(Exercise.sampleData[Int.random(in: 0..<Exercise.sampleData.count)])
            }
            return ret
        }(),
        {()->[Exercise] in
            var ret:[Exercise] = []
            for _ in 1...3 {
                ret.append(Exercise.sampleData[Int.random(in: 0..<Exercise.sampleData.count)])
            }
            return ret
        }()
    ])]
}
