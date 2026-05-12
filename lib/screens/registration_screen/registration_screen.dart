import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_app1/gen/assets.gen.dart';
import 'package:mood_app1/screens/registration_screen/widgets/login_container.dart';
import 'package:mood_app1/screens/registration_screen/widgets/password_container.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        toolbarHeight: 80,
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Text(
              "let's get acquainted!\nYou can register right now!",
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 40),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            EmailInput(
              labelText: 'Enter your email',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            PassswordInput(
              labelText: 'Enter your password',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Confirm password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            PassswordInput(
              controller: TextEditingController(),
              labelText: 'Enter your password',
            ),
            const SizedBox(height: 27),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text(
                'Register',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 1,
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Or Register with',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 1,
                )),
              ],
            ),
            const SizedBox(height: 16),
            const GoogleAppleBoxes(),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class GoogleAppleBoxes extends StatelessWidget {
  const GoogleAppleBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onPressGoogle() {}

    void onPressApple() {}

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            InkWell(
              onTap: onPressGoogle,
              child: Container(
                height: 56,
                width: 105,
                padding: const EdgeInsets.only(
                    left: 30, top: 10, right: 30, bottom: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset(
                          Assets.icons.google,
                          height: 26,
                        ))),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: onPressApple,
              child: Container(
                height: 56,
                width: 105,
                decoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: SvgPicture.asset(
                      Assets.icons.apple,
                      height: 26,
                      width: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
