// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'xdjConstraint.dart';

class autoText extends StatelessWidget {
  /// 要显示的文字
  final String text;

  ///指定text的父容器的宽度
  ///必须制定宽度
  final double width;

  ///最小的字体大小
  final double minTextSize;

  ///正常的字体大小
  final double textSize;

  /// 字体的样式
  final TextStyle textStyle;

  const autoText({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.width,
    required this.minTextSize,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle style = textStyle;
    double size = textSize;
    while (tools.getTextSize(text, style).width > width) {
      size -= 0.5;
      style = style.copyWith(fontSize: size);
    }
    return Text(
      text,
      style: style,
    );
  }
}
