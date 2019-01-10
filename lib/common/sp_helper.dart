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
        SpUtil.putString(key, value == null ? "" : json.encode(value));
        break;
    }
  }

  static LanguageModel getLanguageModel() {
    String _saveLanguage = SpUtil.getString(Constant.keyLanguage);
    if (ObjectUtil.isNotEmpty(_saveLanguage)) {
      Map userMap = json.decode(_saveLanguage);
      return LanguageModel.fromJson(userMap);
    }
    return null;
  }

  static String getThemeColor() {
    String _colorKey = SpUtil.getString(Constant.KEY_THEME_COLOR);
    if (ObjectUtil.isEmpty(_colorKey)) {
      _colorKey = 'gray';
    }
    return _colorKey;
  }

  static SplashModel getSplashModel() {
    String _splashModel = SpUtil.getString(Constant.KEY_SPLASH_MODEL);
    if (ObjectUtil.isNotEmpty(_splashModel)) {
      Map userMap = json.decode(_splashModel);
      return SplashModel.fromJson(userMap);
    }
    return null;
  }
}
