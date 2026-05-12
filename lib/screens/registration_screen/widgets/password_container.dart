import 'package:flutter/material.dart';

class PassswordInput extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const PassswordInput({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  State<PassswordInput> createState() => _PassswordInputState();
}

class _PassswordInputState extends State<PassswordInput> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  void onPressEye() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: _validatePassword,
      obscureText: !_passwordVisible,
      autocorrect: false,
      style: const TextStyle(fontSize: 14),
      cursorHeight: 20,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Theme.of(context).hintColor,
        labelText: widget.labelText,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: const TextStyle(
          fontSize: 12,
          height: 0, // This removes the extra space for error text
        ),
        suffixIcon: IconButton(
          icon:
              Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              onPressEye();
            });
          },
        ),
      ),
    );
  }
}
