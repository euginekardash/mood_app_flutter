import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_app1/bloc/day_data/day_data_bloc.dart';
import 'package:mood_app1/gen/assets.gen.dart';
import 'package:mood_app1/screens/home_screen/widgets/custom_textfield.dart';

class FocusContainer extends StatefulWidget {
  final DateTime date;

  const FocusContainer({super.key, required this.date});

  @override
  State<FocusContainer> createState() => _FocusContainerState();
}

class _FocusContainerState extends State<FocusContainer> {
  final TextEditingController _controller = TextEditingController();

  String _inputText = "";
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  void didUpdateWidget(FocusContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.date != widget.date) {
      _loadInitialData();
    }
  }

  void _loadInitialData() {
    final dayData = context.read<DayDataBloc>().getDayData(widget.date);
    setState(() {
      _inputText = dayData.focus;
    });
  }

  void _handleSubmitted(String value) {
    context.read<DayDataBloc>().add(UpdateFocus(
      date: widget.date,
      focus: value,
    ));
    setState(() {
      _inputText = value;
      _controller.clear();
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayDataBloc, DayDataState>(
      builder: (context, state) {
        final dayData = state.getDayData(widget.date);
        
        if (_inputText.isEmpty && dayData.focus.isNotEmpty) {
          _inputText = dayData.focus;
        }

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
      },
    );
  }
}