import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_app1/gen/assets.gen.dart';

class LoginConatiner extends StatelessWidget {
  const LoginConatiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 50,
          width: 355,
          decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: SvgPicture.asset(Assets.icons.login),
              ),
              Center(
                  child: Text(
                'Log In here',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
              )),
            ],
          )),
    );
  }
}
