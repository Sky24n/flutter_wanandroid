import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class MoneyPage extends StatefulWidget {
  final String title;

  MoneyPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return new _MoneyPageState();
  }
}

class _MoneyPageState extends State<MoneyPage> {
  MoneyUnit moneyUnit = MoneyUnit.YUAN_ZH;
  MoneyFormat moneyFormat = MoneyFormat.NORMAL;

  String _inputText = "";
  String _checkResult = "";

  String _hint = "enum MoneyUnit {" +
      "\n" +
      "   NORMAL, // 6.00" +
      "\n" +
      "   YUAN, // ¥6.00" +
      "\n" +
      "   YUAN_ZH, // 6.00元" +
      "\n" +
      "   DOLLAR, // \$6.00" +
      "\n" +
      "}" +
      "\n" +
      "enum MoneyFormat" +
      "\n" +
      "   NORMAL, //保留两位小数(6.00元)" +
      "\n" +
      "   YEND_INTEGER,//去掉末尾'0'(6.00元->6元,6.60元->6.6元)" +
      "\n" +
      "   YUAN_INTEGER, //整元(6.00元 -> 6元)" +
      "\n" +
      "}"
      "";

  void inputCheck() {
    setState(() {
      _checkResult = MoneyUtil.changeFStr2YWithUnit(_inputText,
          format: moneyFormat, unit: moneyUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: false,
      body: new Column(
        children: <Widget>[
          new Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("Unit",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (true),
                              activeColor: Colors.red,
                              onChanged: (value) {})
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("NORMAL",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (moneyUnit == MoneyUnit.NORMAL),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    moneyUnit = MoneyUnit.NORMAL;
                                    inputCheck();
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("YUAN",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (moneyUnit == MoneyUnit.YUAN),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    moneyUnit = MoneyUnit.YUAN;
                                    inputCheck();
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("YUAN_ZH",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (moneyUnit == MoneyUnit.YUAN_ZH),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    moneyUnit = MoneyUnit.YUAN_ZH;
                                    inputCheck();
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("DOLLAR",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (moneyUnit == MoneyUnit.DOLLAR),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    moneyUnit = MoneyUnit.DOLLAR;
                                    inputCheck();
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("Format",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (true),
                              activeColor: Colors.red,
                              onChanged: (value) {})
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("NORMAL",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (moneyFormat == MoneyFormat.NORMAL),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    moneyFormat = MoneyFormat.NORMAL;
                                    inputCheck();
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("END_INTEGER",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (moneyFormat == MoneyFormat.END_INTEGER),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    moneyFormat = MoneyFormat.END_INTEGER;
                                    inputCheck();
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("YUAN_INTEGER",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (moneyFormat == MoneyFormat.YUAN_INTEGER),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    moneyFormat = MoneyFormat.YUAN_INTEGER;
                                    inputCheck();
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                  ],
                ),
                new Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: new TextField(
                    autofocus: false,
                    style:
                        new TextStyle(fontSize: 14.0, color: Colors.grey[900]),
                    decoration: new InputDecoration(
                        hintText: "请输入... (分)",
                        hintStyle: new TextStyle(fontSize: 14.0)),
                    onChanged: (value) {
                      _inputText = value;
                      inputCheck();
                    },
                  ),
                ),
                new Container(
                  alignment: Alignment.topLeft,
                  height: 36.0,
                  padding: const EdgeInsets.all(10.0),
                  child: new Text(
                    '$_checkResult',
                    textAlign: TextAlign.start,
                    style:
                        new TextStyle(color: Colors.grey[600], fontSize: 14.0),
                  ),
                ),
                new Container(
                  child: new Text(_hint,
                      style: new TextStyle(
                          color: Colors.blueAccent, fontSize: 14.0)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
