package farnsworth.grant.trackout.server.model;

import java.util.UUID;

public class exercise {
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
