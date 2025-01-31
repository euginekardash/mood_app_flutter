import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_app1/bloc/settings/settings_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        toolbarHeight: 80,
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
        ),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark mode'),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return Transform.scale(
                      scale: 0.9,
                      child: Switch(
                        inactiveThumbColor: Colors.black,
                        value: state.appTheme == AppTheme.dark,
                        onChanged: (value) {
                          if (value) {
                            context
                                .read<SettingsBloc>()
                                .add(SelectAppTheme(appTheme: AppTheme.dark));
                          } else {
                            context
                                .read<SettingsBloc>()
                                .add(SelectAppTheme(appTheme: AppTheme.light));
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications'),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return Transform.scale(
                      scale: 0.9,
                      child: Switch(
                        inactiveThumbColor: Colors.black,
                        value: state.isNotificationsEnabled,
                        onChanged: (value) {
                          context
                              .read<SettingsBloc>()
                              .add(ToggleNotifications());
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            InkWell(
              child: Text('Request a feature'),
              onTap: () {},
            ),
            InkWell(
              child: Text('Terms of Use'),
              onTap: () {},
            ),
            InkWell(
              child: Text('Privacy police'),
              onTap: () {},
            ),
            InkWell(
              child: Text('Contact Us'),
              onTap: () async {
                String? encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'kardash675@gmail.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'Example Subject & Symbols are allowed!',
                  }),
                );

                if(await canLaunchUrl(emailUri)){
                  launchUrl(emailUri);
                } else {
                  throw Exception('Could not launch $emailUri');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
