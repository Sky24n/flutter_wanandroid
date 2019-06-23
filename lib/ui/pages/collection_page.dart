import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key key, this.labelId}) : super(key: key);

  final String labelId;

  @override
  Widget build(BuildContext context) {
    LogUtil.e("ReposPage build...... $labelId");
    RefreshController _controller = new RefreshController();
    CollectBloc bloc = BlocProvider.of<CollectBloc>(context);
    MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
    mainBloc.homeEventStream.listen((event) {
      if (labelId == event.labelId) {
        _controller.sendBack(false, event.status);
      }
    });
    bloc.setHomeEventSink(mainBloc.homeEventSink);
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(IntlUtil.getString(context, labelId)),
        centerTitle: true,
      ),
      body: new StreamBuilder(
          stream: bloc.collectListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<ReposModel>> snapshot) {
            int loadStatus =
                Utils.getLoadStatus(snapshot.hasError, snapshot.data);
            if (loadStatus == LoadStatus.loading) {
              bloc.onRefresh(labelId: labelId);
            }
            return new RefreshScaffold(
              labelId: labelId,
              loadStatus: loadStatus,
              controller: _controller,
              onRefresh: ({bool isReload}) {
                return bloc.onRefresh(labelId: labelId, isReload: isReload);
              },
              onLoadMore: (up) {
                bloc.onLoadMore(labelId: labelId);
              },
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                ReposModel model = snapshot.data[index];
                return ObjectUtil.isEmpty(model.envelopePic)
                    ? new ArticleItem(model, labelId: labelId)
                    : new ReposItem(model, labelId: labelId);
              },
            );
          }),
    );
  }
}
