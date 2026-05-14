import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_app1/bloc/day_data/day_data_bloc.dart';
import 'package:mood_app1/gen/assets.gen.dart';

export 'package:mood_app1/bloc/day_data/day_data_bloc.dart' show DayTimePeriod;

class MoodColumn extends StatelessWidget {
  final DateTime date;

  const MoodColumn({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Morning",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        MoodContainer(date: date, timeOfDay: DayPeriod.morning),
        const SizedBox(height: 4),
        Text(
          "Afternoon",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        MoodContainer(date: date, timeOfDay: DayPeriod.afternoon),
        const SizedBox(height: 4),
        Text(
          "Evening",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        MoodContainer(date: date, timeOfDay: DayPeriod.evening),
        const SizedBox(height: 4),
        Text(
          "Night",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        MoodContainer(date: date, timeOfDay: DayPeriod.night),
        const SizedBox(height: 4),
      ],
    );
  }
}

enum DayPeriod { morning, afternoon, evening, night }

class MoodContainer extends StatefulWidget {
  final DateTime date;
  final DayPeriod timeOfDay;

  const MoodContainer({super.key, required this.date, required this.timeOfDay});

  @override
  State<MoodContainer> createState() => _MoodContainerState();
}

class _MoodContainerState extends State<MoodContainer> {
  final List<Map<String, dynamic>> _moodOptions = [
    {'icon': Assets.icons.wonderful, 'label': 'Wonderful'},
    {'icon': Assets.icons.good, 'label': 'Good'},
    {'icon': Assets.icons.nothing, 'label': 'Nothing'},
    {'icon': Assets.icons.bad, 'label': 'Bad'},
    {'icon': Assets.icons.terrible, 'label': 'Terrible'},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(MoodContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.date != widget.date) {
      // Data will be loaded via BlocBuilder
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayDataBloc, DayDataState>(
      builder: (context, state) {
        final dayData = state.getDayData(widget.date);

        Map<String, dynamic>? currentMood;
        String? currentIcon;

        switch (widget.timeOfDay) {
          case DayPeriod.morning:
            if (dayData.moodMorning != null) {
              currentMood = {'label': dayData.moodMorning};
              currentIcon = dayData.moodMorningIcon;
            }
            break;
          case DayPeriod.afternoon:
            if (dayData.moodAfternoon != null) {
              currentMood = {'label': dayData.moodAfternoon};
              currentIcon = dayData.moodAfternoonIcon;
            }
            break;
          case DayPeriod.evening:
            if (dayData.moodEvening != null) {
              currentMood = {'label': dayData.moodEvening};
              currentIcon = dayData.moodEveningIcon;
            }
            break;
          case DayPeriod.night:
            if (dayData.moodNight != null) {
              currentMood = {'label': dayData.moodNight};
              currentIcon = dayData.moodNightIcon;
            }
            break;
        }

        final displayMood = currentMood;
        final displayIcon = currentIcon;

        return GestureDetector(
          onTap: () => _showMoodDialog(context),
          child: Container(
            height: 30,
            width: 150,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const SizedBox(width: 8),
                if (displayMood != null && displayIcon != null)
                  SvgPicture.asset(
                    displayIcon,
                    height: 26,
                  ),
                Text(
                  displayMood != null
                      ? displayMood['label']
                      : 'How do you feel?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      letterSpacing: -0.4),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMoodDialog(BuildContext context) {
    // Получаем текущее настроение из BLoC, чтобы предвыбрать его в диалоге
    final state = context.read<DayDataBloc>().state;
    final dayData = state.getDayData(widget.date);
    String? currentMoodLabel;
    switch (widget.timeOfDay) {
      case DayPeriod.morning:
        currentMoodLabel = dayData.moodMorning;
        break;
      case DayPeriod.afternoon:
        currentMoodLabel = dayData.moodAfternoon;
        break;
      case DayPeriod.evening:
        currentMoodLabel = dayData.moodEvening;
        break;
      case DayPeriod.night:
        currentMoodLabel = dayData.moodNight;
        break;
    }

    Map<String, dynamic>? initialSelectedMood;
    if (currentMoodLabel != null) {
      initialSelectedMood = _moodOptions.firstWhere(
        (mood) => mood['label'] == currentMoodLabel,
        orElse: () => {},
      );
      if (initialSelectedMood.isEmpty) initialSelectedMood = null;
    }

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        Map<String, dynamic>? tempSelectedMood = initialSelectedMood;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: Stack(
                children: [
                  const Center(
                    child: Text('How is your mood?'),
                  ),
                  Positioned(
                    top: -13,
                    right: -10,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: _moodOptions.map((mood) {
                    final isSelected = tempSelectedMood != null &&
                        tempSelectedMood!['label'] == mood['label'];
                    return GestureDetector(
                      onTap: () {
                        setDialogState(() {
                          tempSelectedMood = mood;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).primaryColor.withOpacity(0.4)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                          border: isSelected
                              ? Border.all(width: 1, color: Colors.blue)
                              : null,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              mood['icon'],
                              height: 20,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              mood['label'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: isSelected
                                    ? FontWeight.w400
                                    : FontWeight.w200,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      if (tempSelectedMood != null) {
                        final blocTimeOfDay =
                            _convertToBlocTimeOfDay(widget.timeOfDay);
                        context.read<DayDataBloc>().add(UpdateMood(
                              date: widget.date,
                              timeOfDay: blocTimeOfDay,
                              mood: tempSelectedMood!,
                            ));
                      }
                      Navigator.of(dialogContext).pop();
                    },
                    child: Container(
                      height: 23,
                      width: 83,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text('Done',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  DayTimePeriod _convertToBlocTimeOfDay(DayPeriod period) {
    switch (period) {
      case DayPeriod.morning:
        return DayTimePeriod.morning;
      case DayPeriod.afternoon:
        return DayTimePeriod.afternoon;
      case DayPeriod.evening:
        return DayTimePeriod.evening;
      case DayPeriod.night:
        return DayTimePeriod.night;
    }
  }
}
