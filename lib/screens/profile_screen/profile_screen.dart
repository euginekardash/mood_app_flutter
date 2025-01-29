import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_app1/gen/assets.gen.dart';
import 'package:mood_app1/screens/profile_screen/widgets/login_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        toolbarHeight: 80,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: InkWell(
                onTap: () => context.go('/profile/settings'), child: SvgPicture.asset(Assets.icons.settings)),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.zero ,
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          spacing: 30,
          children: [
            const SizedBox(
              height: 10,
            ),
            LoginConatiner(),
            Container(
              height: 150,
              width: 355,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text('Promotion'),
              ),
            ),
            Container(
              height: 150,
              width: 355,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text('Stats'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
