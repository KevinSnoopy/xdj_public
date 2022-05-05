// ignore_for_file: camel_case_types, file_names, must_be_immutable, non_constant_identifier_names

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'xdjExtension.dart';

class xdjConstraint {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double rpx = 0;
  static double px = 0;
  static double physicalWidth = 0;
  static double physicalHeight = 0;
  static double dpr = 0;
  static double statusHeight = 0;
  static double bottomHeight = 0;
  static double navgationHeight = 44;
  static double fullNavgationHeight = 0;

  static void initialize({double standardWidth = 750}) {
    // 1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2.获取dpr
    dpr = window.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5.底部安全高度
    bottomHeight = window.padding.bottom / dpr;

    // 6.计算rpx px的大小, iPhone6下 1px = 2rpx
    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;

    fullNavgationHeight = statusHeight + navgationHeight;
  }

  // 按照像素来设置
  static double setPx(double size) {
    return xdjConstraint.rpx * size * 2;
  }

  // 按照rxp来设置
  static double setRpx(double size) {
    return xdjConstraint.rpx * size;
  }

  static double setNpx(double size) {
    return xdjConstraint.rpx * size * 2 / 390 * 375;
  }
}

class tools {
  /// 弹框
  static void showMessage(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
            backgroundColor: Colors.transparent,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.xdjAlpha(0.6),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                    child: Text(
                      message,
                      style: text_style.sc_semibold(16, Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
          Timer(const Duration(milliseconds: 1250), () {
            Navigator.pop(context);
          });
          return dialog;
        });
  }

  static void endEditing(BuildContext context) {
    FocusManager.instance.primaryFocus!.unfocus();
    FocusScope.of(context).unfocus();
  }

  static Size getTextSize(String text, TextStyle style) {
    TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
      ellipsis: '...',
    );
    painter.layout();
    return painter.size;
  }

  static double getTextHeight(String text, TextStyle style, double maxWidth) {
    TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: null,
    );
    painter.layout(maxWidth: maxWidth);
    return painter.height;
  }
}
