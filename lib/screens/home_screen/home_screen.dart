import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mood_app1/gen/assets.gen.dart';
import 'package:mood_app1/screens/home_screen/widgets/focus_container.dart';
import 'package:mood_app1/screens/home_screen/widgets/mood_column.dart';
import 'package:mood_app1/widgets/backgroung_gradient.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  void _showDatePicker() async {
    DateTime? pickedDate = await showModalBottomSheet(
      context: context,
      builder: (context) {
        DateTime tempPickedDate = selectedDate;
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColorDark,
            ),
            textTheme: TextTheme(
              bodySmall: TextStyle(fontSize: 12),
              bodyMedium: TextStyle(fontSize: 14),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            height: 440,
            child: Column(
              children: [
                Expanded(
                  child: CalendarDatePicker(
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (date) {
                      tempPickedDate = date;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(tempPickedDate);
                  },
                  child: Text("Select Date"),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  bool isSameDay(DateTime selectedDate) {
  final now = DateTime.now();
  return selectedDate.year == now.year &&
         selectedDate.month == now.month &&
         selectedDate.day == now.day;
}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 80,
            forceMaterialTransparency: true,
            elevation: 0,
            leadingWidth: 30 + 30,
            leading: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: InkWell(
                onTap: _showDatePicker,
                child: SvgPicture.asset(
                  Assets.icons.calendar,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: InkWell(
                  onTap: () => context.go('/profile'),
                  child: SvgPicture.asset(
                    Assets.icons.profile,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ],
            title: InkWell(
              onTap: _showDatePicker,
              child: isSameDay(selectedDate) ? Column(
                children: [
                  Text(
                    "Today",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    DateFormat('dd.MM.yyyy').format(selectedDate),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
                  )
                ],
              ) : Text(
                    DateFormat('dd.MM.yyyy').format(selectedDate),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                  ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FocusContainer(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    MoodColumn(),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

