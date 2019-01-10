import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogUtil.e("SharePage " + ScreenUtil.getInstance().screenWidth.toString());

    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text(IntlUtil.getString(context, Ids.titleShare)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(
              '扫描二维码下载',
              style: new TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            Gaps.vGap15,
            new Card(
              child: new Container(
                alignment: Alignment.center,
                width: ScreenUtil.getInstance().getWidth(300),
                height: ScreenUtil.getInstance().getWidth(300),
                child: new Image.asset(
                  Utils.getImgPath('qrcode'),
                  width: ScreenUtil.getInstance().getWidth(200),
                  height: ScreenUtil.getInstance().getWidth(200),
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
