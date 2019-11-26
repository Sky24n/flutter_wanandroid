import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_wanandroid/common/common.dart';
import 'package:flutter_wanandroid/data/protocol/models.dart';
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
  static void _putObject<T>(String key, Object value) {
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

  static String getThemeColor() {
    return SpUtil.getString(Constant.key_theme_color,
        defValue: 'deepPurpleAccent');
  }
}
