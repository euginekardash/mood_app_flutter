import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_data_event.dart';
part 'day_data_state.dart';
part 'day_data_bloc.g.dart';

class DayDataBloc extends HydratedBloc<DayDataEvent, DayDataState> {
  DayDataBloc() : super(const DayDataState(days: {})) {
    on<UpdateFocus>(_onUpdateFocus);
    on<UpdateMood>(_onUpdateMood);
  }

  void _onUpdateFocus(UpdateFocus event, Emitter<DayDataState> emit) {
    final key = _dateToKey(event.date);
    final currentDayData = state.days[key] ?? const DayData();
    final newDayData = currentDayData.copyWith(focus: event.focus);
    
    final newDays = Map<String, DayData>.from(state.days);
    newDays[key] = newDayData;
    
    emit(state.copyWith(days: newDays));
  }

  void _onUpdateMood(UpdateMood event, Emitter<DayDataState> emit) {
    final key = _dateToKey(event.date);
    final currentDayData = state.days[key] ?? const DayData();
    
    DayData newDayData;
    switch (event.timeOfDay) {
      case DayTimePeriod.morning:
        newDayData = currentDayData.copyWith(
          moodMorning: event.mood['label'] as String?,
          moodMorningIcon: event.mood['icon'] as String?,
        );
        break;
      case DayTimePeriod.afternoon:
        newDayData = currentDayData.copyWith(
          moodAfternoon: event.mood['label'] as String?,
          moodAfternoonIcon: event.mood['icon'] as String?,
        );
        break;
      case DayTimePeriod.evening:
        newDayData = currentDayData.copyWith(
          moodEvening: event.mood['label'] as String?,
          moodEveningIcon: event.mood['icon'] as String?,
        );
        break;
      case DayTimePeriod.night:
        newDayData = currentDayData.copyWith(
          moodNight: event.mood['label'] as String?,
          moodNightIcon: event.mood['icon'] as String?,
        );
        break;
    }
    
    final newDays = Map<String, DayData>.from(state.days);
    newDays[key] = newDayData;
    
    emit(state.copyWith(days: newDays));
  }

  String _dateToKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  DayData getDayData(DateTime date) {
    return state.getDayData(date);
  }

  @override
  DayDataState fromJson(Map<String, dynamic> json) {
    return DayDataState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(DayDataState state) {
    return state.toJson();
  }
}