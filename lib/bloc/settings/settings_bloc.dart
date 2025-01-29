import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../services/notify.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.g.dart';

const fontSizes = [12, 14, 16, 18, 20, 22];

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  final Brightness brightness;

  SettingsBloc({required this.brightness})
      : super(SettingsState(
            onboardingPassed: false,
            isNotificationsEnabled: true,
            appTheme: AppTheme.auto,
            fontSize: 18,
            )) {
    on<PassOnboarding>((event, emit) {
      emit(state.copyWith(onboardingPassed: true));
    });


    on<SendNotify>((event, emit) {
      if (state.isNotificationsEnabled) {
        Future.delayed(const Duration(seconds: 1), () {
          NotificationService().showNotification(
              title: 'It\'s your notification.',
              body: event.title);
        });
      }
    });

    on<ToggleNotifications>((event, emit) {
      emit(state.copyWith(
          isNotificationsEnabled: !state.isNotificationsEnabled));
    });

    on<SelectAppTheme>((event, emit) async {
      emit(state.copyWith(
        appTheme: event.appTheme,
      ));
    });

    on<ToggleTheme>((event, emit) {
      AppTheme nextTheme;
      switch (state.appTheme) {
        case AppTheme.light:
          nextTheme = AppTheme.dark;
          break;
        case AppTheme.dark:
          nextTheme = AppTheme.light;
          break;
        case AppTheme.auto:
        default:
          nextTheme = AppTheme.light;
      }
      emit(state.copyWith(appTheme: nextTheme));
    });

    on<ScaleUpFontSize>((event, emit) {
      if (state.fontSize != fontSizes.last) {
        final nextSize = fontSizes[fontSizes.indexOf(state.fontSize) + 1];
        emit(state.copyWith(fontSize: nextSize));
      }
    });

    on<ScaleDownFontSize>((event, emit) {
      if (state.fontSize != fontSizes.first) {
        final nextSize = fontSizes[fontSizes.indexOf(state.fontSize) - 1];
        emit(state.copyWith(fontSize: nextSize));
      }
    });
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toJson();
  }
}
