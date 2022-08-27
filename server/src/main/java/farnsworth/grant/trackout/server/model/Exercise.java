package farnsworth.grant.trackout.server.model;

import java.util.UUID;

public class Exercise {
    UUID id;
    String name;
    ExerciseType exerciseType;
    enum ExerciseType{
        reps,
        time,
        distance,
        count
    };
}
