import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class RecHotPage extends StatelessWidget {
  const RecHotPage({Key key, this.title, this.titleId}) : super(key: key);

  final String title;
  final String titleId;

  Widget _buildImg(String imgUrl) {
    if (ObjectUtil.isEmpty(imgUrl)) {
      return new Container(
        width: 0.0,
      );
    }
    return new Container(
      width: 72,
      height: 128,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 10.0),
      child: new CachedNetworkImage(
        width: 72,
        height: 128,
        fit: BoxFit.fill,
        imageUrl: imgUrl,
        placeholder: (context, url) => new ProgressView(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RefreshController _controller = new RefreshController();
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    String labelId = title ?? IntlUtil.getString(context, titleId);
    bloc.homeEventStream.listen((event) {
      if (labelId == event.labelId) {
        _controller.sendBack(false, event.status);
      }
    });

    Observable.just(1).delay(new Duration(milliseconds: 500)).listen((_) {
      bloc.getHotRecList(labelId);
    });

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(title ?? IntlUtil.getString(context, titleId)),
        centerTitle: true,
      ),
      body: new StreamBuilder(
          stream: bloc.recListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<ComModel>> snapshot) {
            return new RefreshScaffold(
              labelId: title ?? IntlUtil.getString(context, titleId),
              loadStatus: Utils.getLoadStatus(snapshot.hasError, snapshot.data),
              controller: _controller,
              enablePullUp: false,
              onRefresh: ({bool isReload}) {
                return bloc.getHotRecList(labelId);
              },
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                ComModel model = snapshot.data[index];
                return new InkWell(
                  onTap: () {
                    NavigatorUtil.pushWeb(context,
                        title: model.title, url: model.url, isHome: true);
                  },
                  child: new Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(16.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Expanded(
                              child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                model.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.listTitle,
                              ),
                              Gaps.vGap10,
                              new Text(
                                model.content == null ? "" : model.content,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.listContent,
                              ),
                              Gaps.vGap5,
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    model.author,
                                    style: TextStyles.listExtra,
                                  ),
                                  Gaps.hGap10,
                                  new Text(
                                    Utils.getTimeLine(
                                        context,
                                        DateUtil.getDateMsByTimeStr(
                                            model.updatedAt)),
                                    style: TextStyles.listExtra,
                                  ),
                                ],
                              )
                            ],
                          )),
                          _buildImg(model.imgUrl)
                        ],
                      ),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          border: new Border.all(
                              width: 0.33, color: Colours.divider))),
                );
              },
            );
          }),
    );
  }
}
