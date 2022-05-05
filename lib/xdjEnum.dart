// ignore_for_file: camel_case_types, constant_identifier_names, file_names, camel_case_extensions, must_be_immutable, non_constant_identifier_names, division_optimization

/// 营养素
enum xdjNutrition {
  /// 蛋白质
  protein,

  /// 脂肪
  fat,

  /// 碳水
  carbohydrate
}

/// 营养状态
enum nutritionState {
  /// 合适
  appropriate,

  /// 不太够
  not_enough,

  /// 有些超量
  some_excess,

  /// 缺的比较多
  missing,

  /// 严重缺失
  serious_lack,

  /// 超量了许多
  lot_too_much,

  /// 严重超标
  excess_bid_badly
}

/// 状态
enum xdjState {
  /// 良好
  good,

  /// 一般
  general,

  /// 差
  poor
}

/// 饮食
enum xdjDiet {
  /// 早餐
  breakfast,

  /// 午餐
  lunch,

  /// 晚餐
  dinner,

  /// 加餐
  snacks
}

enum columnType {
  /// 体重
  weight,

  /// 饮食
  diet,

  /// 营养素
  nutrition
}

enum xdjAdvice {
  /// 建议少吃
  less,

  /// 放心吃
  can,

  /// 少量吃
  small
}

enum coachCard {
  /// 周体重
  CARD_TYPE_WEEK_WEIGHT,

  /// 周热量
  CARD_TYPE_WEEK_CALORIES,

  /// 周营养素
  CARD_TYPE_WEEK_NUTRIENT,

  /// 卡片体重
  CARD_TYPE_WEIGHT,

  /// 卡片全天热量
  CARD_TYPE_DAY_CALORIES,

  /// 卡片早餐
  CARD_TYPE_BREAKFAST,

  /// 卡片午餐
  CARD_TYPE_LUNCH,

  /// 卡片晚餐
  CARD_TYPE_DINNER,

  /// 卡片全部营养素
  CARD_TYPE_DAY_NUTRIENT,

  /// 卡片碳水
  CARD_TYPE_CARBOHYDRATE,

  /// 卡片脂肪
  CARD_TYPE_FAT,

  /// 卡片蛋白质
  CARD_TYPE_PROTEIN,

  /// 一对一咨询
  CARD_TYPE_CONSULT
}

enum xdjGrade {
  /// 完美达标
  S3,
  /// 达标
  S2,
  /// 基本达标
  S1,
  /// 严重缺失
  B3,
  /// 缺的比较多
  B2,
  /// 不太够
  B1,
  /// 有些超量
  L1,
  /// 超量了许多
  L2,
  /// 严重超量
  L3
}
