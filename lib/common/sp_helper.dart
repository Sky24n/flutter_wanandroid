import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_wanandroid/common/common.dart';
import 'package:flutter_wanandroid/models/models.dart';

class SpHelper {
  // T 用于区分存储类型
  static void putObject<T>(String key, Object value) {
    switch (T) {
      case int:
        SpUtil.putInt(key, value);
        break;
      case double:
        SpUtil.putDouble(key, value);
        break;
      case bool:
        SpUtil.putBool(key, value);
        break;
      case String:
        SpUtil.putString(key, value);
        break;
      case List:
        SpUtil.putStringList(key, value);
        break;
      default:
        SpUtil.putObject(key, value);
        break;
    }
  }

  static LanguageModel getLanguageModel() {
    Map map = SpUtil.getObject(Constant.keyLanguage);
    return map == null ? null : LanguageModel.fromJson(map);
  }

  static String getThemeColor() {
    return SpUtil.getString(Constant.KEY_THEME_COLOR, defValue: 'gray');
  }

  static SplashModel getSplashModel() {
    Map map = SpUtil.getObject(Constant.KEY_SPLASH_MODEL);
    return map == null ? null : SplashModel.fromJson(map);
  }
}
