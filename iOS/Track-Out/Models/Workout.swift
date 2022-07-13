//
//  Workout.swift
//  Track-Out
//
//  Created by Grant Farnsworth on 6/12/22.
//

import Foundation

enum DistanceUnit{
    case km
    case meter
    case mile
    case yard
}

struct Rep{
    var weight:Int
    var count:Int
}

struct Distance{
    var distance:Float
    var unit: DistanceUnit
}

protocol ExcerciseSet{
    var excercise:Exercise{get}
}

struct ExcerciseSetReps: ExcerciseSet{
    var excercise: Exercise
    var reps:[Rep]
    init(excersise:Exercise){
        self.excercise = excersise
    }
}

struct ExcerciseSetCount: ExcerciseSet{
    var excercise: Exercise
    var count: Int
    init(excersise:Exercise){
        self.excercise = excersise
    }
}

struct ExcerciseSetDistance: ExcerciseSet{
    var excercise: Exercise
    var distance:Distance
    init(excersise:Exercise){
        self.excercise = excersise
    }
}

struct ExcerciseSetTime: ExcerciseSet{
    var excercise: Exercise
    var milliseconds:Int
    init(excersise:Exercise){
        self.excercise = excersise
    }
}

class Workout{
    let routine:Routine
    let index:Int
    let excerciseSets:[ExcerciseSet]
    let timeStamp:Date
    
    init(routine:Routine, index:Int){
        self.routine = routine
        self.index = index
        self.excerciseSets = []
        self.timeStamp = Date.now
        for val in routine.exercises[index]{
            switch(val.cType){
            case .count:excerciseSets.insert(ExcerciseSetCount(excersise:val), at: excerciseSets.endIndex)
            case .distance: excerciseSets.insert(ExcerciseSetDistance(excersise:val), at: excerciseSets.endIndex)
            case .reps: excerciseSets.insert(ExcerciseSetReps(excersise:val), at: excerciseSets.endIndex)
            case .time: excerciseSets.insert(ExcerciseSetTime(excersise:val), at: excerciseSets.endIndex)
            }
        }
    }
}

