import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_wanandroid/common/common.dart';
import 'package:flutter_wanandroid/models/models.dart';

class SpHelper {
  static LanguageModel getLanguageModel() {
    String _saveLanguage = SpUtil.getString(Constant.keyLanguage);
    if (ObjectUtil.isNotEmpty(_saveLanguage)) {
      Map userMap = json.decode(_saveLanguage);
      return LanguageModel.fromJson(userMap);
    }
    return null;
  }
}
