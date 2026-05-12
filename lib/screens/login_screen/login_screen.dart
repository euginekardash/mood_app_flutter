import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_app1/gen/assets.gen.dart';
import 'package:mood_app1/screens/login_screen/widgets/login_input.dart';
import 'package:mood_app1/screens/login_screen/widgets/password_input.dart';
import 'package:mood_app1/screens/login_screen/widgets/reset_password_screen.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            const SizedBox(height: 32.0),
            Text(
              "Hello!\nYou can login here!",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 16.0),
            Text('Enter your email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
            const SizedBox(height: 4.0),
            LoginInput(labelText: 'Email', controller: TextEditingController()),
            const SizedBox(height: 16.0),
            Text(
              'Enter your password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 4.0),
            PassswordInput(
                labelText: 'Password', controller: TextEditingController()),
            const SizedBox(height: 28.0),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.go('/profile/login/reset-password'),
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text(
                'Login',
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
                    'Or Login with',
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
            Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'Register Now',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go('/profile/login/register');
                            print('Register Now tapped');
                          },
                      )
                    ]),
              ),
            ),
            const SizedBox(height: 16),
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
