import 'package:base_library/base_library.dart';
import 'package:flutter_wanandroid/common/common.dart';
import 'package:flutter_wanandroid/models/models.dart';

//模拟网络请求数据
class HttpUtils {
  Future<SplashModel> getSplash() {
    return Future.delayed(Duration(milliseconds: 500), () {
      return SplashModel(
        title: 'Flutter 常用工具类库',
        content: 'Flutter 常用工具类库',
        url: 'https://www.jianshu.com/p/425a7ff9d66e',
        imgUrl:
            'https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_common_utils_a.png',
      );
    });
  }

  /// 该地址可能无法下载，请自行更换可测试apk地址。
  Future<VersionModel> getVersion() async {
    return Future.delayed(Duration(milliseconds: 500), () {
      return VersionModel(
        title: '有新版本v0.2.6，快去更新吧！',
        content: '1.基础库升级 | 2.修复OPPO R15详情页问题 | 3.一些优化~',
        url:
            'https://raw.githubusercontent.com/Sky24n/Doc/master/apks/flutter_wanandroid.apk',
        version: '0.2.6',
      );
    });
  }

  Future<ComModel> getRecItem() async {
    return Future.delayed(Duration(milliseconds: 500), () {
      return null;
    });
  }

  Future<List<ComModel>> getRecList() async {
    return Future.delayed(Duration(milliseconds: 500), () {
      return List();
    });
  }
}
