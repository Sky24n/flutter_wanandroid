import 'dart:collection';

import 'package:azlistview/azlistview.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/data/repository/collect_repository.dart';
import 'package:flutter_wanandroid/data/repository/wan_repository.dart';

class MainBloc implements BlocBase {
  ///****** ****** ****** Home ****** ****** ****** /

  BehaviorSubject<List<BannerModel>> _banner =
      BehaviorSubject<List<BannerModel>>();

  Sink<List<BannerModel>> get _bannerSink => _banner.sink;

  Stream<List<BannerModel>> get bannerStream => _banner.stream;

  BehaviorSubject<List<ReposModel>> _recRepos =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _recReposSink => _recRepos.sink;

  Stream<List<ReposModel>> get recReposStream => _recRepos.stream;

  BehaviorSubject<List<ReposModel>> _recWxArticle =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _recWxArticleSink => _recWxArticle.sink;

  Stream<List<ReposModel>> get recWxArticleStream => _recWxArticle.stream;

  ///****** ****** ****** Home ****** ****** ****** /

  ///****** ****** ****** Repos ****** ****** ****** /
  BehaviorSubject<List<ReposModel>> _repos =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _reposSink => _repos.sink;

  Stream<List<ReposModel>> get reposStream => _repos.stream;

  List<ReposModel> _reposList;
  int _reposPage = 0;

  ///****** ****** ****** Repos ****** ****** ****** /

  ///****** ****** ****** Events ****** ****** ****** /

  BehaviorSubject<List<ReposModel>> _events =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _eventsSink => _events.sink;

  Stream<List<ReposModel>> get eventsStream => _events.stream;

  List<ReposModel> _eventsList;
  int _eventsPage = 0;

  ///****** ****** ****** Events ****** ****** ****** /

  ///****** ****** ****** System ****** ****** ****** /

  BehaviorSubject<List<TreeModel>> _tree = BehaviorSubject<List<TreeModel>>();

  Sink<List<TreeModel>> get _treeSink => _tree.sink;

  Stream<List<TreeModel>> get treeStream => _tree.stream;

  List<TreeModel> _treeList;

  ///****** ****** ****** System ****** ****** ****** /

  ///****** ****** ****** Version ****** ****** ****** /

  BehaviorSubject<VersionModel> _version = BehaviorSubject<VersionModel>();

  Sink<VersionModel> get _versionSink => _version.sink;

  Stream<VersionModel> get versionStream => _version.stream.asBroadcastStream();

  VersionModel _versionModel;

  ///****** ****** ****** Version ****** ****** ****** /

  ///****** ****** ****** ****** ****** ****** /
  BehaviorSubject<StatusEvent> _homeEvent = BehaviorSubject<StatusEvent>();

  Sink<StatusEvent> get homeEventSink => _homeEvent.sink;

  Stream<StatusEvent> get homeEventStream =>
      _homeEvent.stream.asBroadcastStream();

  ///****** ****** ****** ****** ****** ****** /

  ///****** ****** ****** ****** ****** ****** /

  ///****** ****** ****** ****** ****** ****** /

  ///****** ****** ****** personal ****** ****** ****** /

  BehaviorSubject<ComModel> _recItem = BehaviorSubject<ComModel>();

  Sink<ComModel> get _recItemSink => _recItem.sink;

  Stream<ComModel> get recItemStream => _recItem.stream.asBroadcastStream();

  ComModel hotRecModel;

  BehaviorSubject<List<ComModel>> _recList = BehaviorSubject<List<ComModel>>();

  Sink<List<ComModel>> get _recListSink => _recList.sink;

  Stream<List<ComModel>> get recListStream =>
      _recList.stream.asBroadcastStream();

  List<ComModel> hotRecList;

  ///****** ****** ****** personal ****** ****** ****** /

  WanRepository wanRepository = new WanRepository();
  CollectRepository _collectRepository = new CollectRepository();
  HttpUtils httpUtils = new HttpUtils();

  MainBloc() {
    LogUtil.e("MainBloc......");
  }

  @override
  Future getData({String labelId, int page}) {
    switch (labelId) {
      case Ids.titleHome:
        return getHomeData(labelId);
        break;
      case Ids.titleRepos:
        return getArticleListProject(labelId, page);
        break;
      case Ids.titleEvents:
        return getArticleList(labelId, page);
        break;
      case Ids.titleSystem:
        return getTree(labelId);
        break;
      default:
        return Future.delayed(new Duration(seconds: 1));
        break;
    }
  }

  @override
  Future onLoadMore({String labelId}) {
    int _page = 0;
    switch (labelId) {
      case Ids.titleHome:
        break;
      case Ids.titleRepos:
        _page = ++_reposPage;
        break;
      case Ids.titleEvents:
        _page = ++_eventsPage;
        break;
      case Ids.titleSystem:
        break;
      default:
        break;
    }
    LogUtil.e("onLoadMore labelId: $labelId" +
        "   _page: $_page" +
        "   _reposPage: $_reposPage");
    return getData(labelId: labelId, page: _page);
  }

  @override
  Future onRefresh({String labelId, bool isReload}) {
    switch (labelId) {
      case Ids.titleHome:
        getHotRecItem();
        break;
      case Ids.titleRepos:
        _reposPage = 0;
        break;
      case Ids.titleEvents:
        _eventsPage = 0;
        break;
      case Ids.titleSystem:
        break;
      default:
        break;
    }
    LogUtil.e("onRefresh labelId: $labelId" + "   _reposPage: $_reposPage");
    return getData(labelId: labelId, page: 0);
  }

  Future getHomeData(String labelId) {
    getRecRepos(labelId);
    getRecWxArticle(labelId);
    return getBanner(labelId);
  }

  Future getBanner(String labelId) {
    return wanRepository.getBanner().then((list) {
      _bannerSink.add(UnmodifiableListView<BannerModel>(list));
    });
  }

  Future getRecRepos(String labelId) async {
    ComReq _comReq = new ComReq(402);
    wanRepository.getProjectList(data: _comReq.toJson()).then((list) {
      if (list.length > 6) {
        list = list.sublist(0, 6);
      }
      _recReposSink.add(UnmodifiableListView<ReposModel>(list));
    });
  }

  Future getRecWxArticle(String labelId) async {
    int _id = 408;
    wanRepository.getWxArticleList(id: _id).then((list) {
      if (list.length > 6) {
        list = list.sublist(0, 6);
      }
      _recWxArticleSink.add(UnmodifiableListView<ReposModel>(list));
    });
  }

  Future getArticleListProject(String labelId, int page) {
    return wanRepository.getArticleListProject(page).then((list) {
      if (_reposList == null) {
        _reposList = new List();
      }
      if (page == 0) {
        _reposList.clear();
      }
      _reposList.addAll(list);
      _reposSink.add(UnmodifiableListView<ReposModel>(_reposList));
      homeEventSink.add(new StatusEvent(
          labelId,
          ObjectUtil.isEmpty(list)
              ? RefreshStatus.noMore
              : RefreshStatus.idle));
    }).catchError((_) {
      if (ObjectUtil.isEmpty(_reposList)) {
        _repos.sink.addError("error");
      }
      _reposPage--;
      homeEventSink.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
  }

  Future getArticleList(String labelId, int page) {
    return wanRepository.getArticleList(page: page).then((list) {
      if (_eventsList == null) {
        _eventsList = new List();
      }
      if (page == 0) {
        _eventsList.clear();
      }
      _eventsList.addAll(list);
      _eventsSink.add(UnmodifiableListView<ReposModel>(_eventsList));
      homeEventSink.add(new StatusEvent(
          labelId,
          ObjectUtil.isEmpty(list)
              ? RefreshStatus.noMore
              : RefreshStatus.idle));
    }).catchError((_) {
      if (ObjectUtil.isEmpty(_eventsList)) {
        _events.sink.addError("error");
      }
      _eventsPage--;
      homeEventSink.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
  }

  Future getTree(String labelId) {
    return wanRepository.getTree().then((list) {
      if (_treeList == null) {
        _treeList = new List();
      }

      for (int i = 0, length = list.length; i < length; i++) {
        String tag = Utils.getPinyin(list[i].name);
        if (RegExp("[A-Z]").hasMatch(tag)) {
          list[i].tagIndex = tag;
        } else {
          list[i].tagIndex = "#";
        }
      }
      SuspensionUtil.sortListBySuspensionTag(list);

      _treeList.clear();
      _treeList.addAll(list);
      _treeSink.add(UnmodifiableListView<TreeModel>(_treeList));
      homeEventSink.add(new StatusEvent(
          labelId,
          ObjectUtil.isEmpty(list)
              ? RefreshStatus.noMore
              : RefreshStatus.idle));
    }).catchError((_) {
      if (ObjectUtil.isEmpty(_reposList)) {
        _tree.sink.addError("error");
      }
      homeEventSink.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
  }

  Future getVersion() async {
    httpUtils.getVersion().then((model) {
      _versionModel = model;
      _versionSink.add(_versionModel);
    });
  }

  Future getHotRecItem() async {
    httpUtils.getRecItem().then((model) {
      hotRecModel = model;
      _recItemSink.add(hotRecModel);
    });
  }

  Future getHotRecList(String labelId) async {
    httpUtils.getRecList().then((list) {
      hotRecList = list;
      _recListSink.add(UnmodifiableListView<ComModel>(list));
      homeEventSink.add(new StatusEvent(
          labelId,
          ObjectUtil.isEmpty(list)
              ? RefreshStatus.noMore
              : RefreshStatus.idle));
    }).catchError((_) {
      homeEventSink.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
  }

  void doCollection(String labelId, int id, bool isCollect) {
    LogUtil.e("doCollection id: $id, isCollect: $isCollect");
    if (isCollect) {
      _collectRepository.collect(id).then((bool suc) {
        onCollectRefresh(labelId, id, isCollect);
      });
    } else {
      _collectRepository.unCollect(id).then((bool suc) {
        onCollectRefresh(labelId, id, isCollect);
      });
    }
  }

  void onCollectRefresh(String labelId, int id, bool isCollect) {
    if (ObjectUtil.isNotEmpty(_reposList)) {
      _reposList?.forEach((model) {
        if (id == model.id) {
          model.collect = isCollect;
        }
        return model;
      });
      _reposSink.add(UnmodifiableListView<ReposModel>(_reposList));
    }
    if (ObjectUtil.isNotEmpty(_eventsList)) {
      _eventsList?.forEach((model) {
        if (id == model.id) {
          model.collect = isCollect;
        }
        return model;
      });
      _eventsSink.add(UnmodifiableListView<ReposModel>(_eventsList));
    }
  }

  void test() {
    LogUtil.e("MainBloc test 1.....");
  }

  @override
  void dispose() {
    _banner.close();
    _recRepos.close();
    _recWxArticle.close();
    _repos.close();
    _events.close();
    _tree.close();
    _homeEvent.close();
    _version.close();
    _recItem.close();
    _recList.close();
  }
}
