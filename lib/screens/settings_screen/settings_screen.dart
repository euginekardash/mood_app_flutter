import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_app1/bloc/settings/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onSelectTheme({required AppTheme appTheme}) {
      context.read<SettingsBloc>().add(SelectAppTheme(appTheme: appTheme));
    }

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
                    return Switch(
                      inactiveThumbColor: Colors.black,
                      value: state.appTheme == AppTheme.dark,
                      onChanged: (value) {
                        if (value) {
                          context.read<SettingsBloc>().add(SelectAppTheme(appTheme: AppTheme.dark));
                        } else {
                          context.read<SettingsBloc>().add(SelectAppTheme(appTheme: AppTheme.light));
                        }
                      },
                    );
                  },
                ),
              ],
            ),
            InkWell(child: Text('Notification'), onTap: (){},),
            InkWell(child: Text('Request a feature'), onTap: (){},),
            InkWell(child: Text('Terms of Use'), onTap: (){},),
            InkWell(child: Text('Privacy police'), onTap: (){},),
            InkWell(child: Text('Contact Us'), onTap: (){},),
          ],
        ),
      ),
    );
  }
}
