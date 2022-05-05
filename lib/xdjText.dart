// ignore_for_file: file_names, camel_case_types, no_logic_in_create_state, must_be_immutable, non_constant_identifier_names, division_optimization, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';

class xdjText extends StatefulWidget {
  final TextStyle style;
  final String value;
  xdjText({
    Key? key,
    required this.style,
    required this.value,
  }) : super(key: key);

  late xdjTextState state = xdjTextState(
    style: style,
    value: value,
  );

  void update(String? title) {
    state.title = title ?? "";
    if (state.mounted) {
      state.setState(() {});
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return state;
  }
}

class xdjTextState extends State<xdjText> {
  final TextStyle style;
  final String value;
  xdjTextState({required this.style, required this.value}) : super();

  String? title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title ?? value,
      maxLines: 1000,
      style: style,
    );
  }
}
