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
    init(excersise:Exercise, reps: [Rep] = []){
        self.excercise = excersise
        self.reps = reps
    }
}

struct ExcerciseSetCount: ExcerciseSet{
    var excercise: Exercise
    var count: Int
    init(excersise:Exercise, count: Int = 0){
        self.excercise = excersise
        self.count = count
    }
}

struct ExcerciseSetDistance: ExcerciseSet{
    var excercise: Exercise
    var distance:Distance
    init(excersise:Exercise, distance:Distance = Distance(distance: 0.0, unit: DistanceUnit.mile)){
        self.excercise = excersise
        self.distance = distance
    }
}

struct ExcerciseSetTime: ExcerciseSet{
    var excercise: Exercise
    var milliseconds:Int
    init(excersise:Exercise, milliseconds:Int = 0){
        self.excercise = excersise
        self.milliseconds = milliseconds
    }
}

class Workout{
    let routine:Routine
    let index:Int
    var excerciseSets:[ExcerciseSet]
    let timeStamp:Date
    
    init(routine:Routine, index:Int){
        self.routine = routine
        self.index = index
        self.excerciseSets = []
        self.timeStamp = Date.now
        for val in routine.exercises[index].exercises{
            switch(val.cType){
            case .count:excerciseSets.insert(ExcerciseSetCount(excersise:val), at: excerciseSets.endIndex)
            case .distance: excerciseSets.insert(ExcerciseSetDistance(excersise:val), at: excerciseSets.endIndex)
            case .reps: excerciseSets.insert(ExcerciseSetReps(excersise:val), at: excerciseSets.endIndex)
            case .time: excerciseSets.insert(ExcerciseSetTime(excersise:val), at: excerciseSets.endIndex)
            }
        }
    }
}

