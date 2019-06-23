import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

bool isSystemInit = true;

class SystemPage extends StatelessWidget {
  const SystemPage({Key key, this.labelId}) : super(key: key);

  final String labelId;

  @override
  Widget build(BuildContext context) {
    LogUtil.e("SystemPage build......");
    RefreshController _controller = new RefreshController();
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
//    bloc.homeEventStream.listen((event) {
//      if (labelId == event.labelId) {
//        _controller.sendBack(false, event.status);
//      }
//    });

    if (isSystemInit) {
      LogUtil.e("SystemPage init......");
      isSystemInit = false;
      Observable.just(1).delay(new Duration(milliseconds: 500)).listen((_) {
        bloc.onRefresh(labelId: labelId);
      });
    }

    return new StreamBuilder(
        stream: bloc.treeStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<TreeModel>> snapshot) {
          return new RefreshScaffold(
            labelId: labelId,
            loadStatus: Utils.getLoadStatus(snapshot.hasError, snapshot.data),
            controller: _controller,
            enablePullUp: false,
            onRefresh: ({bool isReload}) {
              return bloc.onRefresh(labelId: labelId, isReload: isReload);
            },
            onLoadMore: (up) {},
            itemCount: snapshot.data == null ? 0 : snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              TreeModel model = snapshot.data[index];
              return new TreeItem(model);
            },
          );
        });
  }
}
