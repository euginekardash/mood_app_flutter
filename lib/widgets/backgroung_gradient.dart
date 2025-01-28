import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_app1/gen/assets.gen.dart';

import '../bloc/settings/settings_bloc.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          child: Container(
            key: Key(state.appTheme.name),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Theme.of(context).brightness == Brightness.dark ? Assets.images.homeBackground.path :  Assets.images.homeBackground.path),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}
