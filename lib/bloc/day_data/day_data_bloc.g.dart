// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_data_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayData _$DayDataFromJson(Map<String, dynamic> json) => DayData(
      focus: json['focus'] as String? ?? '',
      moodMorning: json['moodMorning'] as String?,
      moodAfternoon: json['moodAfternoon'] as String?,
      moodEvening: json['moodEvening'] as String?,
      moodNight: json['moodNight'] as String?,
      moodMorningIcon: json['moodMorningIcon'] as String?,
      moodAfternoonIcon: json['moodAfternoonIcon'] as String?,
      moodEveningIcon: json['moodEveningIcon'] as String?,
      moodNightIcon: json['moodNightIcon'] as String?,
    );

Map<String, dynamic> _$DayDataToJson(DayData instance) => <String, dynamic>{
      'focus': instance.focus,
      'moodMorning': instance.moodMorning,
      'moodAfternoon': instance.moodAfternoon,
      'moodEvening': instance.moodEvening,
      'moodNight': instance.moodNight,
      'moodMorningIcon': instance.moodMorningIcon,
      'moodAfternoonIcon': instance.moodAfternoonIcon,
      'moodEveningIcon': instance.moodEveningIcon,
      'moodNightIcon': instance.moodNightIcon,
    };

DayDataState _$DayDataStateFromJson(Map<String, dynamic> json) =>
    DayDataState(
      days: (json['days'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, DayData.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
    );

Map<String, dynamic> _$DayDataStateToJson(DayDataState instance) =>
    <String, dynamic>{
      'days': instance.days.map((k, e) => MapEntry(k, e.toJson())),
    };