package farnsworth.grant.trackout.server.model;

import farnsworth.grant.trackout.server.ServerApplication;
import org.springframework.data.util.Pair;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

public class ExerciseSet {
    private static final Logger LOGGER = LoggerFactory.getLogger(ServerApplication.class);
    private Map<Exercise, SetValues> ExerciseRecord;

    public ExerciseSet() {
        ExerciseRecord = new HashMap<>();
    }

    public ExerciseSet(Map<Exercise, SetValues> ExerciseRecord) {
        this.ExerciseRecord = ExerciseRecord;
    }

    public class SetValues {
        private Optional<List<Pair<Integer, Weight>>> RepSets;
        private Optional<List<Integer>> CountSet;
        private Optional<List<Time>> TimeSet;
        private Optional<List<Distance>> DistanceSet;
        private Optional<List<Pair<Time, Distance>>> TimeDistanceSet;

        private Exercise.ExerciseType setType;

        public SetValues(List GenSets, Exercise.ExerciseType setType) {
            this.setType = setType;
            this.RepSets = Optional.empty();
            this.CountSet = Optional.empty();
            this.DistanceSet = Optional.empty();
            this.TimeSet = Optional.empty();
            this.TimeDistanceSet = Optional.empty();

            switch (setType) {
                case reps -> {
                    try {
                        this.RepSets = Optional.of((List<Pair<Integer, Weight>>) GenSets);
                    }
                    catch (ClassCastException e){
                        LOGGER.error("List type does not match set type of %s", setType.name());
                    }
                }
                case time -> {
                    try {
                        this.TimeSet = Optional.of((List<Time>) GenSets);
                    }
                    catch (ClassCastException e){
                        LOGGER.error("List type does not match set type of %s", setType.name());
                    }
                }
                case distance -> {
                    try {
                        this.DistanceSet = Optional.of((List<Distance>) GenSets);
                    }
                    catch (ClassCastException e){
                        LOGGER.error("List type does not match set type of %s", setType.name());
                    }
                }
                case count -> {
                    try {
                        this.CountSet = Optional.of((List<Integer>) GenSets);
                    }
                    catch (ClassCastException e){
                        LOGGER.error("List type does not match set type of %s", setType.name());
                    }
                }
            }
        }

        public Optional<List<Pair<Integer, Weight>>> getRepSets() {
            return RepSets;
        }

        public Optional<List<Integer>> getCountSet() {
            return CountSet;
        }

        public Optional<List<Time>> getTimeSet() {
            return TimeSet;
        }

        public Optional<List<Distance>> getDistanceSet() {
            return DistanceSet;
        }

        public Optional<List<Pair<Time, Distance>>> getTimeDistanceSet() {
            return TimeDistanceSet;
        }

        public Exercise.ExerciseType getSetType() {
            return setType;
        }

        public void addAll(List genList) {
            switch (setType) {

                case reps -> {
                    if (RepSets.isPresent())
                        this.RepSets.get().addAll((List<Pair<Integer, Weight>>) genList);
                    else
                        LOGGER.error("attempt to add to empty optional: RepSet");
                }
                case time -> {
                    if (TimeSet.isPresent())
                        this.TimeSet.get().addAll((List<Time>) genList);
                    else
                        LOGGER.error("attempt to add to empty optional: TimeSet");
                }
                case distance -> {
                    if (DistanceSet.isPresent())
                        this.DistanceSet.get().addAll((List<Distance>) genList);
                    else
                        LOGGER.error("attempt to add to empty optional: DistanceSet");
                }
                case count -> {
                    if (CountSet.isPresent())
                        this.CountSet.get().addAll((List<Integer>) genList);
                    else
                        LOGGER.error("attempt to add to empty optional: CountSet");
                }
            }
        }
    }

        public static final class Weight {
            private final int value;
            private final WeightUnits unit;

            public Weight(int value, WeightUnits unit) {
                this.value = value;
                this.unit = unit;
            }

            public int getValue() {
                return value;
            }

            public WeightUnits getUnit() {
                return unit;
            }

            public enum WeightUnits {
                KG,
                Pounds
            }
        }

        public static final class Distance {
            private final int value;
            private final DistanceUnits unit;

            public Distance(int value, DistanceUnits unit) {
                this.value = value;
                this.unit = unit;
            }

            public int getValue() {
                return value;
            }

            public DistanceUnits getUnit() {
                return unit;
            }

            public enum DistanceUnits {
                Meters,
                KM,
                Feet,
                Yards,
                Miles
            }
        }

        public final class Time {
            private final int value;
            private final TimeUnits unit;

            public Time(int value, TimeUnits unit) {
                this.value = value;
                this.unit = unit;
            }

            public int getValue() {
                return value;
            }

            public TimeUnits getUnit() {
                return unit;
            }

            public enum TimeUnits {
                Seconds,
                Minutes,
                Hours
            }
        }
    }
