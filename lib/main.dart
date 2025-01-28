import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_app1/bloc/settings/settings_bloc.dart';
import 'package:mood_app1/initialise_app.dart';
import 'package:mood_app1/screens/home_screen/home_screen.dart';
import 'package:mood_app1/themes/dark_theme.dart';
import 'package:mood_app1/themes/light_theme.dart';
import 'package:status_bar_control/status_bar_control.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialiseApp();

  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  final connectivity = await Connectivity().checkConnectivity();
  final connected = connectivity.first == ConnectivityResult.wifi ||
      connectivity.first == ConnectivityResult.ethernet;

  final brightness = WidgetsBinding.instance.window.platformBrightness;

  runApp(
    BlocProvider(
      create: (context) {
        return SettingsBloc(brightness: brightness); // Pass brightness here
      },
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        // Add more routes here as needed
        // Example:
        // GoRoute(
        //   path: '/details',
        //   builder: (context, state) => const DetailsScreen(),
        // ),
      ],
    );

    return BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
      Future<void> setSystemColor() async {
        if (settingsState.appTheme == AppTheme.dark) {
          await StatusBarControl.setStyle(StatusBarStyle.LIGHT_CONTENT);
        }

        if (settingsState.appTheme == AppTheme.light) {
          await StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);
        }

        if (settingsState.appTheme == AppTheme.auto) {
          if (brightness == Brightness.dark) {
            await StatusBarControl.setStyle(StatusBarStyle.LIGHT_CONTENT);
          } else {
            await StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);
          }
        }
      }

      setSystemColor();

      ThemeMode themeMode;
      if (settingsState.appTheme == AppTheme.auto) {
        themeMode = ThemeMode.system;
      } else if (settingsState.appTheme == AppTheme.dark) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }

      return MaterialApp.router(
        routerConfig: router,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
