//
//  Exercise.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 5/30/22.
//

import Foundation
class Exercise: Identifiable, NSCopying, Hashable, Equatable{
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Exercise(id: id, name: name, cType: cType)
    }
    
    enum countType{
        case reps
        case time
        case distance
        case count
    }
    
    var id: UUID
    var name: String
    var cType:countType
    
    init(id:UUID = UUID(), name:String, cType:countType) {
        self.id = id
        self.name = name
        self.cType = cType
    }
}

extension Exercise{
    static let sampleData:[Exercise] =
    [
        Exercise(name:"Bench Press", cType: countType.reps),
        Exercise(name:"Incline Press", cType: countType.reps),
        Exercise(name:"Military Press", cType: countType.reps),
        Exercise(name:"Decline Press", cType: countType.reps),
        Exercise(name:"Dumbell Press", cType: countType.reps),
        Exercise(name:"Dumbell Flyes", cType: countType.reps),
        Exercise(name:"Cable Flyes", cType: countType.reps),
        Exercise(name:"Pull-Ups", cType: countType.count),
        Exercise(name:"Lat Pull-Downs", cType: countType.reps),
        Exercise(name:"Dumbell Rows", cType: countType.reps),
        Exercise(name: "Seated Cable Rows", cType: countType.reps),
        Exercise(name: "Shrugs", cType: countType.reps),
        Exercise(name: "Arnold Press", cType: countType.reps),
        Exercise(name: "Delt Rows", cType: countType.reps),
        Exercise(name: "Dumbell Raises", cType: countType.reps),
    ]
}
