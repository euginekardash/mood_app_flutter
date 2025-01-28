import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_app1/gen/assets.gen.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final bool isEditing;

  const CustomTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    required this.isEditing,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isTyping = false;

  late final VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _listener = () {
      if (!mounted) return;
      setState(() {
        _isTyping = widget.controller.text.isNotEmpty;
      });
    };

    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 220,
      child: TextField(
        controller: widget.controller,
        maxLines: 1,
        cursorHeight: 15,
        autofocus: widget.isEditing ? true : false,
        onSubmitted: widget.onSubmitted,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(217, 232, 234, 1),
          hintText: 'Write your focus...',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(28, 91, 124, 0.5),
          ),
          suffixIcon: !_isTyping
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    Assets.icons.pen,
                  ),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 18,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(170, 207, 221, 1),
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
