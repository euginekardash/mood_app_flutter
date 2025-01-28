import 'package:flutter/material.dart';

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

class MoodContainer extends StatelessWidget {
  const MoodContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 150,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              'How do you fell?',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(28, 91, 124, 0.5),
                  letterSpacing: -0.4),
            )
          ],
        ),
      ),
    );
  }
}
