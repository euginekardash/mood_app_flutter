// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) =>
    SettingsState(
      onboardingPassed: json['onboardingPassed'] as bool,
      isNotificationsEnabled: json['isNotificationsEnabled'] as bool,
      appTheme: $enumDecode(_$AppThemeEnumMap, json['appTheme']),
      fontSize: (json['fontSize'] as num).toInt(),
    );

Map<String, dynamic> _$SettingsStateToJson(SettingsState instance) =>
    <String, dynamic>{
      'onboardingPassed': instance.onboardingPassed,
      'isNotificationsEnabled': instance.isNotificationsEnabled,
      'appTheme': _$AppThemeEnumMap[instance.appTheme]!,
      'fontSize': instance.fontSize,
    };

const _$AppThemeEnumMap = {
  AppTheme.auto: 'auto',
  AppTheme.dark: 'dark',
  AppTheme.light: 'light',
};
