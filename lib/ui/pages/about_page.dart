import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/ui/pages/author_page.dart';
import 'package:flutter_wanandroid/ui/pages/other_page.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    ComModel github = new ComModel(
        title: 'GitHub',
        url: 'https://github.com/Sky24n/flutter_wanandroid',
        extra: 'Go Star');
    ComModel author = new ComModel(title: '作者', page: AuthorPage());
    ComModel other = new ComModel(title: 'Big Thanks', page: OtherPage());

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(IntlUtil.getString(context, Ids.titleAbout)),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 160.0,
              alignment: Alignment.center,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: new Image.asset(
                      Utils.getImgPath('ic_launcher_news'),
                      width: 72.0,
                      fit: BoxFit.fill,
                      height: 72.0,
                    ),
                  ),
                  Gaps.vGap5,
                  new Text(
                    '版本号 ' + AppConfig.version,
                    style: new TextStyle(color: Colours.gray_99, fontSize: 14.0),
                  )
                ],
              ),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  border: new Border.all(width: 0.33, color: Colours.divider))),
          new ComArrowItem(github),
          new ComArrowItem(author),
          new StreamBuilder(
              stream: bloc.versionStream,
              builder:
                  (BuildContext context, AsyncSnapshot<VersionModel> snapshot) {
                VersionModel model = snapshot.data;
                return new Container(
                  child: new Material(
                    color: Colors.white,
                    child: new ListTile(
                      onTap: () {
                        if (model == null) {
                          bloc.getVersion();
                        } else {
                          if (Utils.getUpdateStatus(model.version) != 0) {
                            NavigatorUtil.launchInBrowser(model.url,
                                title: model.title);
                          }
                        }
                      },
                      title: new Text('版本更新'),
                      //dense: true,
                      trailing: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            model == null
                                ? ''
                                : (Utils.getUpdateStatus(model.version) == 0
                                    ? '已是最新版'
                                    : '有新版本，去更新吧'),
                            style: TextStyle(
                                color: (model != null &&
                                        Utils.getUpdateStatus(model.version) !=
                                            0)
                                    ? Colors.red
                                    : Colors.grey,
                                fontSize: 14.0),
                          ),
                          new Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  decoration: Decorations.bottom,
                );
              }),
          new ComArrowItem(other),
        ],
      ),
    );
  }
}
