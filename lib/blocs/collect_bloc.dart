import 'dart:collection';

import 'package:flutter_wanandroid/blocs/bloc_provider.dart';
import 'package:flutter_wanandroid/data/protocol/models.dart';
import 'package:flutter_wanandroid/data/repository/collect_repository.dart';
import 'package:flutter_wanandroid/event/event.dart';
import 'package:flutter_wanandroid/utils/util_index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

class CollectBloc implements BlocBase {
  BehaviorSubject<List<ReposModel>> _collectListBs =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _collectListSink => _collectListBs.sink;

  Stream<List<ReposModel>> get collectListStream =>
      _collectListBs.stream.asBroadcastStream();

  List<ReposModel> _collectList;
  int _collectPage = 0;

  CollectRepository _collectRepository = new CollectRepository();

  @override
  Future getData({String labelId, int page}) {
    return getCollectList(labelId, page);
  }

  @override
  Future onLoadMore({String labelId}) {
    int _page = ++_collectPage;
    return getData(labelId: labelId, page: _page);
  }

  @override
  Future onRefresh({String labelId, bool isReload}) {
    LogUtil.e("CollectBloc onRefresh...... $labelId");
    _collectPage = 0;
    if (isReload == true) {
      _collectListSink.add(null);
    }
    return getData(labelId: labelId, page: _collectPage);
  }

  Future getCollectList(String labelId, int page) {
    return _collectRepository.getCollectList(page).then((list) {
      if (_collectList == null) {
        _collectList = new List();
      }
      if (page == 0) {
        _collectList.clear();
      }
      _collectList.addAll(list);
      _collectListSink.add(UnmodifiableListView<ReposModel>(_collectList));
      _homeEventSink?.add(new StatusEvent(
          labelId,
          ObjectUtil.isEmpty(list)
              ? RefreshStatus.noMore
              : RefreshStatus.idle));
    }).catchError((_) {
      if (ObjectUtil.isEmpty(_collectList)) {
        _collectListBs.sink.addError("error");
      }
      _collectPage--;
      _homeEventSink?.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
  }

  Sink<StatusEvent> _homeEventSink;

  void setHomeEventSink(Sink<StatusEvent> eventSink) {
    _homeEventSink = eventSink;
  }

  @override
  void dispose() {
    _collectListBs.close();
  }
}
