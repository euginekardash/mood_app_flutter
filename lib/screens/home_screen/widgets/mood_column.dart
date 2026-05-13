import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_app1/gen/assets.gen.dart';

class MoodColumn extends StatelessWidget {
  const MoodColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Morning",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        MoodContainer(),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Afternoon",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        MoodContainer(),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Evening",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        MoodContainer(),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Night",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        MoodContainer(),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}

class MoodContainer extends StatefulWidget {
  const MoodContainer({
    super.key,
  });

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

  Map<String, dynamic>? _selectedMood;

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              width: 8,
            ),
            if (_selectedMood != null)
              SvgPicture.asset(
                _selectedMood!['icon'],
                height: 26,
              ),
            Text(
              _selectedMood != null
                  ? (_selectedMood!['label'])
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
  }

  void _showMoodDialog(BuildContext context) {
    Map<String, dynamic>? tempSelectedMood = _selectedMood;

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                      setState(() {
                        _selectedMood = tempSelectedMood;
                      });
                      Navigator.of(context).pop();
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
}
