// ignore_for_file: camel_case_types, file_names, camel_case_extensions, must_be_immutable, non_constant_identifier_names, division_optimization

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'xdjConstraint.dart';
import 'xdjEnum.dart';

extension image_string on String {
  AssetImage get image {
    return AssetImage("lib/resource/" + this);
  }
}

extension color_string on String {
  Color get color {
    String hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.white;
  }
}

extension nutrition_string on String {
  static String nutritionString(xdjNutrition nutrition) {
    switch (nutrition) {
      case xdjNutrition.protein:
        return "蛋白质";
      case xdjNutrition.fat:
        return "脂肪";
      case xdjNutrition.carbohydrate:
        return "碳水";
    }
  }
}

extension diet_string on String {
  static String dietString(xdjDiet diet) {
    switch (diet) {
      case xdjDiet.breakfast:
        return "早餐";
      case xdjDiet.lunch:
        return "午餐";
      case xdjDiet.dinner:
        return "晚餐";
      case xdjDiet.snacks:
        return "加餐";
    }
  }
}

extension nutritionState_string on String {
  static String stateString(nutritionState state) {
    switch (state) {
      case nutritionState.appropriate:
        return "合适";
      case nutritionState.not_enough:
        return "不太够";
      case nutritionState.some_excess:
        return "有些超量";
      case nutritionState.missing:
        return "缺的比较多";
      case nutritionState.serious_lack:
        return "严重缺失";
      case nutritionState.lot_too_much:
        return "超量了许多";
      case nutritionState.excess_bid_badly:
        return "严重超标";
    }
  }

  nutritionState get state {
    switch (this) {
      case "B3":
        return nutritionState.serious_lack;
      case "B2":
        return nutritionState.missing;
      case "B1":
        return nutritionState.not_enough;
      case "L1":
        return nutritionState.some_excess;
      case "L2":
        return nutritionState.lot_too_much;
      case "L3":
        return nutritionState.excess_bid_badly;
    }
    return nutritionState.appropriate;
  }
}

extension advice_string on String {
  static String adviceString(xdjAdvice advice) {
    switch (advice) {
      case xdjAdvice.less:
        return "建议少吃";
      case xdjAdvice.can:
        return "放心吃";
      case xdjAdvice.small:
        return "少量吃";
    }
  }

  static String healthString(int? light) {
    if (light != null) {
      if (light == 1) {
        return "放心吃";
      } else if (light == 3) {
        return "建议少吃";
      }
    }
    return "少量吃";
  }
}

extension grade_string on String {
  xdjGrade get grade {
    switch (this) {
      case "S3":
        return xdjGrade.S3;
      case "S2":
        return xdjGrade.S2;
      case "S1":
        return xdjGrade.S1;
      case "B3":
        return xdjGrade.B3;
      case "B2":
        return xdjGrade.B2;
      case "B1":
        return xdjGrade.B1;
      case "L1":
        return xdjGrade.L1;
      case "L2":
        return xdjGrade.L2;
      case "L3":
        return xdjGrade.L3;
    }
    return xdjGrade.S3;
  }

  bool get appropriate {
    if (this == "S3" || this == "S2" || this == "S1") {
      return true;
    }
    return false;
  }

  /// 0 合理 1 超量 2 不足
  int get howMany {
    if (length == 2) {
      String value = substring(0, 1);
      if (value == "L") {
        return 1;
      } else if (value == "B") {
        return 2;
      }
    }
    return 0;
  }

  int get level {
    if (length == 2) {
      String value = substring(1, 2);
      if (value == "1") {
        return 0;
      } else if (value == "2") {
        return 1;
      } else if (value == "3") {
        return 2;
      }
    }
    return 0;
  }
}

extension date_string on String {
  /// yyyymmdd
  DateTime get date {
    if (length == 8) {
      return DateTime(year, month, day);
    }
    return DateTime.now();
  }

  int get year {
    if (length == 8) {
      return int.parse(substring(0, 4));
    }
    return 0;
  }

  int get month {
    if (length == 8) {
      return int.parse(substring(4, 6));
    }
    return 0;
  }

  int get day {
    if (length == 8) {
      return int.parse(substring(6, 8));
    }
    return 0;
  }

  String get mmdd {
    if (length == 8) {
      return month.toString() + "月" + day.toString() + "日";
    }
    return "";
  }
}

extension date on DateTime {
  /// yyyymmdd
  String get yyyymmdd {
    String year = this.year.toString();
    String month = this.month.toString();
    String day = this.day.toString();
    if (this.month <= 9) {
      month = "0" + month;
    }
    if (this.day <= 9) {
      day = "0" + day;
    }
    return year + month + day;
  }

  String get yyyYmMdD {
    String year = this.year.toString();
    String month = this.month.toString();
    String day = this.day.toString();
    if (this.month <= 9) {
      month = "0" + month;
    }
    if (this.day <= 9) {
      day = "0" + day;
    }
    return year + "/" + month + "/" + day;
  }

  /// mmddhhmm
  String get mmddhhmm {
    String month = this.month.toString();
    String day = this.day.toString();
    String hour = this.hour.toString();
    String minute = this.minute.toString();
    if (this.month <= 9) {
      month = '0' + month;
    }
    if (this.day <= 9) {
      day = '0' + day;
    }
    if (this.hour <= 9) {
      hour = '0' + hour;
    }
    if (this.minute <= 9) {
      minute = '0' + minute;
    }
    return month + '-' + day + ' ' + hour + ':' + minute;
  }

  List<String> get weeks {
    List<String> weekStrings = [];
    int first = 1 - weekday;
    for (int i = 0; i < 7; i++) {
      weekStrings.add(add(Duration(days: first + i)).yyyymmdd);
    }
    return weekStrings;
  }

  String get handle {
    DateTime different = DateTime.now();
    int dYear = different.year;
    int dMonth = different.month;
    int dDay = different.day;
    int dHour = different.hour;
    int dMinute = different.minute;
    if (year > dYear) {
      return (year - dYear).toString() + "年后";
    } else if (month > dMonth) {
      return (month - dMonth).toString() + "月后";
    } else if (day > dDay) {
      return (day - dDay).toString() + "天后";
    } else if (hour > dHour) {
      return (hour - dHour).toString() + "小时后";
    } else if (minute > dMinute) {
      return (minute - dMinute).toString() + "分后";
    }
    return '';
  }
}

extension xdjStatefulWidget on StatefulWidget {
  MaterialApp app(bool black) {
    if (black) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
    return MaterialApp(
      home: this,
    );
  }
}

extension xdjDouble on double {
  double get px {
    return xdjConstraint.setPx(this);
  }

  double get npx {
    return xdjConstraint.setNpx(this);
  }

  double get rpx {
    return xdjConstraint.setRpx(this);
  }

  String get noZero {
    return toString().noZero;
  }

  String get dotOne {
    return ((NumUtil.getNumByValueDouble(this, 1)) ?? this)
        .toStringAsFixed(1)
        .noZero;
  }
}

extension string on String {
  String get noZero {
    if (contains(".") && length > 1) {
      if (substring(length - 1, length) == "0" ||
          substring(length - 1, length) == ".") {
        return substring(0, length - 1).noZero;
      }
    }
    return this;
  }

  bool get nameLegal {
    if (length > 1 && length < 17) {
      List<String> list = ["，",",",".","!","？","。","？","：","；","‘","！","“","\"","—","…","、","~","&","%","·","`","~","<",">","《","》","{","}","【","】","[","]","（","）","(",")","@","*","￥","\$","#"," "];
      for (String l in list) {
        if (contains(l)) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

}

extension xdjInt on int {
  double get px {
    return xdjConstraint.setPx(toDouble());
  }

  double get npx {
    return xdjConstraint.setNpx(toDouble());
  }

  double get rpx {
    return xdjConstraint.setRpx(toDouble());
  }

  coachCard get card {
    switch (this) {
      case 1001:
        return coachCard.CARD_TYPE_WEEK_WEIGHT;
      case 1002:
        return coachCard.CARD_TYPE_WEEK_CALORIES;
      case 1003:
        return coachCard.CARD_TYPE_WEEK_NUTRIENT;
      case 2001:
        return coachCard.CARD_TYPE_WEIGHT;
      case 3001:
        return coachCard.CARD_TYPE_DAY_CALORIES;
      case 3002:
        return coachCard.CARD_TYPE_BREAKFAST;
      case 3003:
        return coachCard.CARD_TYPE_LUNCH;
      case 3004:
        return coachCard.CARD_TYPE_DINNER;
      case 4001:
        return coachCard.CARD_TYPE_DAY_NUTRIENT;
      case 4002:
        return coachCard.CARD_TYPE_CARBOHYDRATE;
      case 4003:
        return coachCard.CARD_TYPE_FAT;
      case 4004:
        return coachCard.CARD_TYPE_PROTEIN;
      case 5001:
        return coachCard.CARD_TYPE_CONSULT;
      default:
        return coachCard.CARD_TYPE_WEEK_WEIGHT;
    }
  }

  String get handle {
    int second = 60;
    int minute = 60;
    int hour = 24;
    if (this < second) {
      return toString() + "秒后";
    } else if (this < second * minute) {
      return (this / second).toInt().toString() + "分后";
    } else if (this < second * minute * hour) {
      return (this / second / minute).toInt().toString() + "小时后";
    } else {
      return (this / second / minute / hour).toInt().toString() + "天后";
    }
  }
}

extension xdjColor on Color {

  Color xdjAlpha(double a) {
    return withAlpha((255 * a).toInt());
  }

  static Color get gradientStart {
    return "#2B2A86".color;
  }

  static Color get gradientEnd {
    return "#9A88EF".color;
  }

  /// 体重
  static Color get weight {
    return "#A1ADF9".color;
  }

  /// 蛋白质
  static Color get protein {
    return "#F3DAA0".color;
  }

  /// 脂肪
  static Color get fat {
    return "#FFA78C".color;
  }

  /// 碳水
  static Color get carbohydrate {
    return "#978AE0".color;
  }

  /// 良好
  static Color get good {
    return "#29CB7C".color;
  }

  /// 一般
  static Color get general {
    return "#FDC54E".color;
  }

  /// 差
  static Color get poor {
    return "#F65B4F".color;
  }

  /// 早餐
  static Color get breakfast {
    return "#F3DAA0".color;
  }

  /// 午餐
  static Color get lunch {
    return "#FFA78C".color;
  }

  /// 晚餐
  static Color get dinner {
    return "#978AE0".color;
  }

  /// 加餐
  static Color get snacks {
    return "#ADE3DA".color;
  }

  static Color nutritionColor(xdjNutrition nutrition) {
    switch (nutrition) {
      case xdjNutrition.protein:
        return xdjColor.protein;
      case xdjNutrition.fat:
        return xdjColor.fat;
      case xdjNutrition.carbohydrate:
        return xdjColor.carbohydrate;
    }
  }

  static Color stateColor(xdjState state) {
    switch (state) {
      case xdjState.good:
        return xdjColor.good;
      case xdjState.general:
        return xdjColor.general;
      case xdjState.poor:
        return xdjColor.poor;
    }
  }

  static Color adviceColor(xdjAdvice advice) {
    switch (advice) {
      case xdjAdvice.less:
        return xdjColor.poor;
      case xdjAdvice.can:
        return xdjColor.good;
      case xdjAdvice.small:
        return xdjColor.general;
    }
  }

  static Color healthColor(int? light) {
    if (light != null) {
      if (light == 1) {
        return xdjColor.good;
      } else if (light == 3) {
        return xdjColor.poor;
      }
    }
    return xdjColor.general;
  }

  static Color dietColor(xdjDiet diet) {
    switch (diet) {
      case xdjDiet.breakfast:
        return xdjColor.breakfast;
      case xdjDiet.lunch:
        return xdjColor.lunch;
      case xdjDiet.dinner:
        return xdjColor.dinner;
      case xdjDiet.snacks:
        return xdjColor.snacks;
    }
  }

  static Color appropriateColor(nutritionState state) {
    switch (state) {
      case nutritionState.appropriate:
        return xdjColor.good;
      default:
        return xdjColor.poor;
    }
  }
}

extension Font on FontWeight {

  static get regular {
    return FontWeight.w400;
  }

  static get medium {
    return FontWeight.w500;
  }

  static get semiBold {
    return FontWeight.w600;
  }

  static get light {
    return FontWeight.w300;
  }

}

extension text_style on TextStyle {
  /// 字体
  static TextStyle style(
      double fontSize, Color color, FontWeight fontWeight, String? fontFamily) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: fontSize.px,
      fontWeight: fontWeight,
    );
  }

  static TextStyle completeStyle(double fontSize, Color color,
      FontWeight fontWeight, String? fontFamily, double textHeight) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize.px,
        fontWeight: fontWeight,
        height: textHeight);
  }

  static TextStyle sc_style(
      double fontSize, Color color, FontWeight fontWeight) {
    return text_style.style(fontSize, color, fontWeight, "PingFangSC");
  }

  static TextStyle alt_style(
      double fontSize, Color color, FontWeight fontWeight) {
    return text_style.style(fontSize, color, fontWeight, "DIN Alternate");
  }

  static TextStyle sc_regular(double fontSize, Color color) {
    return text_style.sc_style(fontSize, color, FontWeight.normal);
  }

  static TextStyle sc_medium(double fontSize, Color color) {
    return text_style.sc_style(fontSize, color, FontWeight.w500);
  }

  static TextStyle sc_semibold(double fontSize, Color color) {
    return text_style.sc_style(fontSize, color, FontWeight.w600);
  }

  static TextStyle sc_light(double fontSize, Color color) {
    return text_style.sc_style(fontSize, color, FontWeight.w300);
  }

  static TextStyle alt_bold(double fontSize, Color color) {
    return text_style.alt_style(fontSize, color, FontWeight.bold);
  }
}

extension list on List {

  static List<Color> columnColors(columnType type) {
    switch (type) {
      case columnType.weight:
        return [
          xdjColor.weight,
        ];
      case columnType.diet:
        return [
          xdjColor.breakfast,
          xdjColor.lunch,
          xdjColor.dinner,
          xdjColor.snacks,
        ];
      case columnType.nutrition:
        return [
          xdjColor.protein,
          xdjColor.fat,
          xdjColor.carbohydrate,
        ];
    }
  }

  static List<Color> guideColors(bool isGreen) {
    if (isGreen) {
      return [
        "#29CB7C".color.xdjAlpha(0.6),
        "#29CB7C".color.xdjAlpha(0.3),
        "#F2F2F2".color,
      ];
    } else {
      return [
        "#F65B4F".color.xdjAlpha(0.6),
        "#F65B4F".color.xdjAlpha(0.3),
        "#F2F2F2".color,
      ];
    }
  }

  static List<int> proportions(List<double> list) {
    double all = 0;
    int last = 0;
    List<int> values = [];
    for (int i = 0; i < list.length; i++) {
      double value = list[i];
      all += value;
      if (value > 0) {
        last = i;
      }
    }
    for (int i = 0; i < list.length; i++) {
      double value = list[i];
      if (value > 0) {
        if (i == last) {
          int lastNum = 100;
          for (int num in values) {
            lastNum -= num;
          }
          values.add(lastNum);
        } else {
          values.add((value * 100 / all).toInt());
        }
      } else {
        values.add(0);
      }
    }
    return values;
  }
}
