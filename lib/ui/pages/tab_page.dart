import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class TabPage extends StatefulWidget {
  const TabPage(
      {Key key, this.labelId, this.title, this.titleId, this.treeModel})
      : super(key: key);

  final String labelId;
  final String title;
  final String titleId;
  final TreeModel treeModel;

  @override
  State<StatefulWidget> createState() {
    return new TabPageState();
  }
}

class TabPageState extends State<TabPage> {
  List<BlocProvider<ComListBloc>> _children = new List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TabBloc bloc = BlocProvider.of<TabBloc>(context);
    bloc.bindSystemData(widget.treeModel);

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(
            widget.title ?? IntlUtil.getString(context, widget.titleId)),
        centerTitle: true,
      ),
      body: new StreamBuilder(
          stream: bloc.tabTreeStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<TreeModel>> snapshot) {
            if (snapshot.data == null) {
              Observable.just(1)
                  .delay(new Duration(milliseconds: 500))
                  .listen((_) {
                bloc.getData(labelId: widget.labelId);
              });
              return new ProgressView();
            }
            _children = snapshot.data
                .map((TreeModel model) {
                  return new BlocProvider<ComListBloc>(
                    child: new ComListPage(
                      labelId: widget.labelId,
                      cid: model.id,
                    ),
                    bloc: new ComListBloc(),
                  );
                })
                .cast<BlocProvider<ComListBloc>>()
                .toList();
            return new DefaultTabController(
                length: snapshot.data == null ? 0 : snapshot.data.length,
                child: new Column(children: <Widget>[
                  new Material(
                    color: Theme.of(context).primaryColor,
                    //elevation: 4.0,
                    child: new SizedBox(
                      height: 48.0,
                      width: double.infinity,
                      child: new TabBar(
                        isScrollable: true,
                        //labelPadding: EdgeInsets.all(12.0),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: snapshot.data
                            ?.map(
                                (TreeModel model) => new Tab(text: model.name))
                            ?.toList(),
                      ),
                    ),
                  ),
                  new Expanded(child: new TabBarView(children: _children))
                ]));
          }),
    );
  }

  @override
  void dispose() {
    for (int i = 0, length = _children.length; i < length; i++) {
      _children[i].bloc.dispose();
    }
    super.dispose();
  }
}
