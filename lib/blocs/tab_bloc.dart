import 'dart:collection';

import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/data/repository/wan_repository.dart';

class TabBloc implements BlocBase {
  BehaviorSubject<List<TreeModel>> _tabTree =
      BehaviorSubject<List<TreeModel>>();

  Sink<List<TreeModel>> get _tabTreeSink => _tabTree.sink;

  Stream<List<TreeModel>> get tabTreeStream => _tabTree.stream;

  List<TreeModel> treeList;

  WanRepository wanRepository = new WanRepository();

  @override
  Future getData({String labelId, int page}) {
    switch (labelId) {
      case Ids.titleReposTree:
        return getProjectTree(labelId);
        break;
      case Ids.titleWxArticleTree:
        return getWxArticleTree(labelId);
        break;
      case Ids.titleSystemTree:
        return getSystemTree(labelId);
        break;
      default:
        return Future.delayed(new Duration(seconds: 1));
        break;
    }
  }

  @override
  Future onLoadMore({String labelId}) {
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    return getData(labelId: labelId);
  }

  void bindSystemData(TreeModel model) {
    if (model == null) return;
    treeList = model.children;
  }

  Future getProjectTree(String labelId) {
    return wanRepository.getProjectTree().then((list) {
      _tabTreeSink.add(UnmodifiableListView<TreeModel>(list));
    });
  }

  Future getWxArticleTree(String labelId) {
    return wanRepository.getWxArticleChapters().then((list) {
      _tabTreeSink.add(UnmodifiableListView<TreeModel>(list));
    });
  }

  Future getSystemTree(String labelId) {
    return Future.delayed(new Duration(milliseconds: 500)).then((_) {
      _tabTreeSink.add(UnmodifiableListView<TreeModel>(treeList));
    });
  }

  Future getTree(String labelId) {
    return wanRepository.getProjectTree().then((list) {
      if (treeList == null) {
        treeList = new List();
      }
      treeList.clear();
      treeList.addAll(list);
      _tabTreeSink.add(UnmodifiableListView<TreeModel>(treeList));
//      _homeEventSink.add(new StatusEvent(
//          labelId,
//          ObjectUtil.isEmpty(list)
//              ? RefreshStatus.noMore
//              : RefreshStatus.idle));
    }).catchError((_) {
//      _homeEventSink.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
  }

  @override
  void dispose() {
    _tabTree.close();
  }
}
