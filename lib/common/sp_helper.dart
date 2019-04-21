import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_wanandroid/common/common.dart';
import 'package:flutter_wanandroid/models/models.dart';

class SpHelper {
  /// T 用于区分存储类型
  /// Example.
  /// SpHelper.putObject<int>(key, value);
  /// SpHelper.putObject<double>(key, value);
  /// SpHelper.putObject<bool>(key, value);
  /// SpHelper.putObject<String>(key, value);
  /// SpHelper.putObject<List>(key, value);
  ///
  /// SpHelper.putObject(key, UserModel);
  ///
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

  static Object getObject<T>(String key) {
    Map map = SpUtil.getObject(key);
    if (map == null) return null;
    Object obj;
    switch (T) {
      case SplashModel:
        obj = SplashModel.fromJson(map);
        break;
      case LanguageModel:
        obj = LanguageModel.fromJson(map);
        break;
      case VersionModel:
        obj = VersionModel.fromJson(map);
        break;
      default:
        break;
    }
    return obj;
  }

  static String getThemeColor() {
    return SpUtil.getString(Constant.key_theme_color, defValue: 'gray');
  }
}
