import 'package:flutter/material.dart';

class NoteContainer extends StatelessWidget {
  const NoteContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245,
      width: 150,
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 251, 252, 100),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Note',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w300),
            ),
            Text(
              'Describe your day...',
              style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor,),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            Divider(
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}