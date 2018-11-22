import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text(IntlUtil.getString(context, StringIds.titleShare)),
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
            new SizedBox(
              height: 15.0,
            ),
            new Card(
              child: new Container(
                alignment: Alignment.center,
                width: 300,
                height: 300,
                child: new Image.asset(
                  Utils.getImgPath('qrcode'),
                  width: 200.0,
                  height: 200.0,
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
