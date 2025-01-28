import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_app1/gen/assets.gen.dart';
import 'package:mood_app1/screens/home_screen/widgets/custom_textfield.dart';

class FocusContainer extends StatefulWidget {
  const FocusContainer({super.key});

  @override
  State<FocusContainer> createState() => _FocusContainerState();
}

class _FocusContainerState extends State<FocusContainer> {
  final TextEditingController _controller = TextEditingController();

  String _inputText = "";
  bool _isEditing = false;

  void _handleSubmitted(String value) {
    setState(() {
      _inputText = value;
      _controller.clear();
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Main focus",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (_isEditing || _inputText.isEmpty)
              CustomTextField(
                isEditing: _isEditing,
                controller: _controller,
                onSubmitted: _handleSubmitted,
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Text(
                        _inputText,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isEditing = true;
                          _controller.text = _inputText;
                        });
                      },
                      child: SvgPicture.asset(
                        Assets.icons.pen,
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
