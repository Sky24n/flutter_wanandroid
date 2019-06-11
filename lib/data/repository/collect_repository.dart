import 'package:base_library/base_library.dart';
import 'package:flutter_wanandroid/common/common.dart';
import 'package:flutter_wanandroid/data/api/apis.dart';
import 'package:flutter_wanandroid/data/protocol/models.dart';

class CollectRepository {
  Future<List<ReposModel>> getCollectList(int page) async {
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
        .request<Map<String, dynamic>>(
            Method.get,
            WanAndroidApi.getPath(
                path: WanAndroidApi.lg_collect_list, page: page));
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    List<ReposModel> list;
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      list = comData.datas?.map((value) {
        ReposModel model = ReposModel.fromJson(value);
        model.collect = true;
        return model;
      })?.toList();
    }
    return list;
  }

  Future<bool> collect(int id) async {
    BaseResp baseResp = await DioUtil().request(Method.post,
        WanAndroidApi.getPath(path: WanAndroidApi.lg_collect, page: id));
    if (baseResp.code != Constant.status_success) {
      return Future.error(baseResp.msg);
    }
    return true;
  }

  Future<bool> unCollect(int id) async {
    BaseResp baseResp = await DioUtil().request(
        Method.post,
        WanAndroidApi.getPath(
            path: WanAndroidApi.lg_uncollect_originid, page: id));
    if (baseResp.code != Constant.status_success) {
      return Future.error(baseResp.msg);
    }
    return true;
  }
}
