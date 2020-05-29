import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/ui/pages/author_page.dart';
import 'package:flutter_wanandroid/ui/pages/other_page.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    ComModel github = ComModel(
        title: 'GitHub',
        url: 'https://github.com/Sky24n/flutter_wanandroid',
        extra: 'Go Star');
    ComModel author = ComModel(title: '作者', page: AuthorPage());
    ComModel other = ComModel(title: 'Big Thanks', page: OtherPage());

    return Scaffold(
      appBar: AppBar(
        title: Text(IntlUtil.getString(context, Ids.titleAbout)),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: 160.0,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: Image.asset(
                      Utils.getImgPath('ic_launcher_news'),
                      width: 72.0,
                      fit: BoxFit.fill,
                      height: 72.0,
                    ),
                  ),
                  Gaps.vGap5,
                  Text(
                    '版本号 ' + AppConfig.version,
                    style: TextStyle(color: Colours.gray_99, fontSize: 14.0),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.33, color: Colours.divider))),
          ComArrowItem(github),
          ComArrowItem(author),
          StreamBuilder(
              stream: bloc.versionStream,
              builder:
                  (BuildContext context, AsyncSnapshot<VersionModel> snapshot) {
                VersionModel model = snapshot.data;
                return Container(
                  child: Material(
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        if (model == null) {
                          bloc.getVersion();
                        } else {
                          if (Utils.getUpdateStatus(model.version) > 0) {
                            //NavigatorUtil.launchInBrowser(model.url, title: model.title);
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => UpgradeDialog(
                                versionModel: model,
                                valueChanged: (value) {
//                                  InstallPlugin.installApk(
//                                          value, AppConfig.appId)
//                                      .then((result) {
//                                    LogUtil.e('install apk $result');
//                                  }).catchError((error) {
//                                    LogUtil.e('install apk error: $error');
//                                  });
                                },
                              ),
                            );
                          }
                        }
                      },
                      title: Text('版本更新'),
                      //dense: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
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
                          Icon(
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
          ComArrowItem(other),
        ],
      ),
    );
  }
}
