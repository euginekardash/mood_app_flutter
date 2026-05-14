part of 'day_data_bloc.dart';

abstract class DayDataEvent extends Equatable {
  const DayDataEvent();

  @override
  List<Object?> get props => [];
}

class UpdateFocus extends DayDataEvent {
  final DateTime date;
  final String focus;

  const UpdateFocus({required this.date, required this.focus});

  @override
  List<Object?> get props => [date, focus];
}

class UpdateMood extends DayDataEvent {
  final DateTime date;
  final DayTimePeriod timeOfDay;
  final Map<String, dynamic> mood;

  const UpdateMood({required this.date, required this.timeOfDay, required this.mood});

  @override
  List<Object?> get props => [date, timeOfDay, mood];
}

class LoadDayData extends DayDataEvent {
  final DateTime date;

  const LoadDayData({required this.date});

  @override
  List<Object?> get props => [date];
}

enum DayTimePeriod { morning, afternoon, evening, night }