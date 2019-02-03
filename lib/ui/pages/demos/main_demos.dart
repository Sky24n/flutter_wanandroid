import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/ui/pages/demos/index.dart';
import 'package:flutter_wanandroid/utils/navigator_util.dart';

class ItemModel {
  String title;
  Widget page;

  ItemModel(this.title, this.page);
}

class MainDemosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainDemosPageState();
  }
}

class MainDemosPageState extends State<MainDemosPage> {
  List<ItemModel> mItemList = new List();

  @override
  void initState() {
    super.initState();
    mItemList.add(new ItemModel("我的Flutter开源库集合", null));
    mItemList.add(new ItemModel("汉字转拼音", new PinyinPage("汉字转拼音")));
    mItemList.add(new ItemModel("城市列表", new CitySelectPage("City Select")));
    mItemList.add(new ItemModel("Date Util", new DatePage("Date Util")));
    mItemList.add(new ItemModel("Regex Util", new RegexUtilPage("Regex Util")));
    mItemList.add(new ItemModel("Widget Util", new WidgetUtilPage("Widget Util")));
    mItemList.add(new ItemModel("Timer Util", new TimerPage("Timer Util")));
    mItemList.add(new ItemModel("Money Util", new MoneyPage("Money Util")));
    mItemList
        .add(new ItemModel("Timeline Util", new TimelinePage("Timeline Util")));
    mItemList
        .add(new ItemModel("圆形/圆角头像", new RoundPortraitPage(title: '圆形/圆角头像')));
    mItemList.add(new ItemModel("SpUtil", new SpUtilPage('SpUtil')));
  }

  Widget buildItem(ItemModel model) {
    return new InkWell(
        onTap: () {
          if (model.page == null) {
            NavigatorUtil.pushWeb(context,
                url: 'https://www.jianshu.com/p/9e5cc4ba3a8e',
                title: '我的Flutter开源库集合');
          } else {
            NavigatorUtil.pushPage(context, model.page, pageName: model.title);
          }
        },
        child: new Container(
            height: 50.0,
            child: new Center(
              child: new Text(
                model.title,
                style: new TextStyle(fontSize: 14.0, color: Color(0xFF666666)),
              ),
            ),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
                color: Colors.white,
                border:
                    new Border.all(width: 0.33, color: Color(0XFFEFEFEF)))));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Demos"),
        centerTitle: true,
      ),
      body: new ListView.builder(
          itemCount: mItemList.length,
          itemBuilder: (BuildContext context, int index) {
            ItemModel model = mItemList[index];
            return buildItem(model);
          }),
    );
  }
}
