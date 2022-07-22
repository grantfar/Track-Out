//
//  Day.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 7/21/22.
//

import Foundation

class Day: Identifiable,NSCopying{
    
    init(exercises:[Exercise], index:Int){
        self.exercises = exercises
        self.index = index
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Day(exercises: exercises.map{$0.copy() as! Exercise}, index: index)
    }
    
    let id:UUID = UUID()
    var exercises:[Exercise]
    var index:Int
    
}
