part of 'day_data_bloc.dart';

@JsonSerializable()
class DayData extends Equatable {
  final String focus;
  final String? moodMorning;
  final String? moodAfternoon;
  final String? moodEvening;
  final String? moodNight;
  final String? moodMorningIcon;
  final String? moodAfternoonIcon;
  final String? moodEveningIcon;
  final String? moodNightIcon;

  const DayData({
    this.focus = '',
    this.moodMorning,
    this.moodAfternoon,
    this.moodEvening,
    this.moodNight,
    this.moodMorningIcon,
    this.moodAfternoonIcon,
    this.moodEveningIcon,
    this.moodNightIcon,
  });

  DayData copyWith({
    String? focus,
    String? moodMorning,
    String? moodAfternoon,
    String? moodEvening,
    String? moodNight,
    String? moodMorningIcon,
    String? moodAfternoonIcon,
    String? moodEveningIcon,
    String? moodNightIcon,
  }) {
    return DayData(
      focus: focus ?? this.focus,
      moodMorning: moodMorning ?? this.moodMorning,
      moodAfternoon: moodAfternoon ?? this.moodAfternoon,
      moodEvening: moodEvening ?? this.moodEvening,
      moodNight: moodNight ?? this.moodNight,
      moodMorningIcon: moodMorningIcon ?? this.moodMorningIcon,
      moodAfternoonIcon: moodAfternoonIcon ?? this.moodAfternoonIcon,
      moodEveningIcon: moodEveningIcon ?? this.moodEveningIcon,
      moodNightIcon: moodNightIcon ?? this.moodNightIcon,
    );
  }

  @override
  List<Object?> get props => [
        focus,
        moodMorning,
        moodAfternoon,
        moodEvening,
        moodNight,
        moodMorningIcon,
        moodAfternoonIcon,
        moodEveningIcon,
        moodNightIcon,
      ];

  factory DayData.fromJson(Map<String, dynamic> json) => _$DayDataFromJson(json);

  Map<String, dynamic> toJson() => _$DayDataToJson(this);
}

@JsonSerializable()
class DayDataState extends Equatable {
  final Map<String, DayData> days;

  const DayDataState({required this.days});

  factory DayDataState.fromJson(Map<String, dynamic> json) =>
      _$DayDataStateFromJson(json);

  Map<String, dynamic> toJson() => _$DayDataStateToJson(this);

  DayDataState copyWith({
    Map<String, DayData>? days,
  }) {
    return DayDataState(days: days ?? this.days);
  }

  DayData getDayData(DateTime date) {
    final key = _dateToKey(date);
    return days[key] ?? const DayData();
  }

  static String _dateToKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  List<Object?> get props => [days];
}