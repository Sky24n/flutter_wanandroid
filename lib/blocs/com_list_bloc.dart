import 'dart:collection';

import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/data/repository/wan_repository.dart';

class ComListBloc implements BlocBase {
  BehaviorSubject<List<ReposModel>> _comListData =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _comListSink => _comListData.sink;

  Stream<List<ReposModel>> get comListStream => _comListData.stream;

  List<ReposModel> comList;
  int _comListPage = 0;

  BehaviorSubject<StatusEvent> _comListEvent = BehaviorSubject<StatusEvent>();

  Sink<StatusEvent> get _comListEventSink => _comListEvent.sink;

  Stream<StatusEvent> get comListEventStream =>
      _comListEvent.stream.asBroadcastStream();

  WanRepository wanRepository = new WanRepository();

  @override
  Future getData({String labelId, int cid, int page}) {
    switch (labelId) {
      case Ids.titleReposTree:
        return getRepos(labelId, cid, page);
        break;
      case Ids.titleWxArticleTree:
        return getWxArticle(labelId, cid, page);
        break;
      case Ids.titleSystemTree:
        return getArticle(labelId, cid, page);
        break;
      default:
        return Future.delayed(new Duration(seconds: 1));
        break;
    }
  }

  @override
  Future onLoadMore({String labelId, int cid}) {
    int _page = 0;
    _page = ++_comListPage;
    return getData(labelId: labelId, cid: cid, page: _page);
  }

  @override
  Future onRefresh({String labelId, int cid}) {
    switch (labelId) {
      case Ids.titleReposTree:
        _comListPage = 1;
        break;
      case Ids.titleWxArticleTree:
        _comListPage = 1;
        break;
      case Ids.titleSystemTree:
        _comListPage = 0;
        break;
      default:
        break;
    }

    return getData(labelId: labelId, cid: cid, page: _comListPage);
  }

  Future getRepos(String labelId, int cid, int page) async {
    ComReq _comReq = new ComReq(cid);
    return wanRepository
        .getProjectList(page: page, data: _comReq.toJson())
        .then((list) {
      if (comList == null) comList = new List();
      if (page == 1) {
        comList.clear();
      }
      comList.addAll(list);
      _comListSink.add(UnmodifiableListView<ReposModel>(comList));
      _comListEventSink.add(new StatusEvent(labelId,
          ObjectUtil.isEmpty(list) ? RefreshStatus.noMore : RefreshStatus.idle,
          cid: cid));
    }).catchError((_) {
      _comListPage--;
      _comListEventSink.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
  }

  Future getWxArticle(String labelId, int cid, int page) async {
    return wanRepository.getWxArticleList(id: cid, page: page).then((list) {
      if (comList == null) comList = new List();
      if (page == 1) {
        comList.clear();
      }
      comList.addAll(list);
      _comListSink.add(UnmodifiableListView<ReposModel>(comList));
      _comListEventSink.add(new StatusEvent(labelId,
          ObjectUtil.isEmpty(list) ? RefreshStatus.noMore : RefreshStatus.idle,
          cid: cid));
    }).catchError((_) {
      _comListPage--;
      _comListEventSink.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
  }

  Future getArticle(String labelId, int cid, int page) async {
    ComReq _comReq = new ComReq(cid);
    return wanRepository
        .getArticleList(page: page, data: _comReq.toJson())
        .then((list) {
      if (comList == null) comList = new List();
      if (page == 0) {
        comList.clear();
      }
      comList.addAll(list);
      _comListSink.add(UnmodifiableListView<ReposModel>(comList));
      _comListEventSink.add(new StatusEvent(labelId,
          ObjectUtil.isEmpty(list) ? RefreshStatus.noMore : RefreshStatus.idle,
          cid: cid));
    }).catchError((_) {
      _comListPage--;
      _comListEventSink.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
  }

  @override
  void dispose() {
    _comListData.close();
    _comListEvent.close();
  }
}
