import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class AuthorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ComModel> list = new List();
    list.add(new ComModel(typeId: 0));
    list.add(new ComModel(
        title: "Github", url: "https://github.com/Sky24n", extra: "Go Follow"));
    list.add(new ComModel(
        title: "简书",
        url: "https://www.jianshu.com/u/cbf2ad25d33a",
        extra: "+关注"));
    list.add(new ComModel(
        title: "掘金",
        url: "https://juejin.im/user/5b9e8a92e51d453df0440422",
        extra: "+关注"));
    list.add(new ComModel(
        title: "我的Flutter开源库集合",
        url: "https://www.jianshu.com/p/9e5cc4ba3a8e"));
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('作者'),
        centerTitle: true,
      ),
      body: new ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            ComModel model = list[index];
            if (model.typeId == 0) {
              return new Container(
                child: new Material(
                  color: Colors.white,
                  child: new ListTile(
                    onTap: () {},
                    title: new Text(
                      '您的Star就是我的动力',
                      style: new TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    //dense: true,
                  ),
                ),
                decoration: Decorations.bottom,
              );
            }
            return new ComArrowItem(model);
          }),
    );
  }
}
