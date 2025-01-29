part of 'settings_bloc.dart';

enum AppTheme { auto, dark, light }

@JsonSerializable()
class SettingsState extends Equatable {
  final bool onboardingPassed;
  final bool isNotificationsEnabled;
  final AppTheme appTheme;
  final int fontSize;

  const SettingsState(
      {required this.onboardingPassed,
      required this.isNotificationsEnabled,
      required this.appTheme,
      required this.fontSize});

  ThemeMode get currentThemeMode {
    switch (appTheme) {
      case AppTheme.dark:
        return ThemeMode.dark;
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.auto:
      default:
        return ThemeMode.system;
    }
  }

  SettingsState copyWith({
    bool? onboardingPassed,
    bool? isNotificationsEnabled,
    AppTheme? appTheme,
    ThemeMode? themeMode,
    int? fontSize,
  }) {
    return SettingsState(
        onboardingPassed: onboardingPassed ?? this.onboardingPassed,
        isNotificationsEnabled:
            isNotificationsEnabled ?? this.isNotificationsEnabled,
        appTheme: appTheme ?? this.appTheme,
        fontSize: fontSize ?? this.fontSize);
  }

  @override
  List<Object> get props =>
      [onboardingPassed, isNotificationsEnabled, appTheme, fontSize];

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsStateToJson(this);
}
