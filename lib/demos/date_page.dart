import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class DatePage extends StatefulWidget {
  final String title;

  DatePage(this.title);

  @override
  State<StatefulWidget> createState() {
    return new _DatePageState();
  }
}

class _DatePageState extends State<DatePage> {
  String _dateFormat = DateFormats.full;

  bool isZH = true;

  String _checkResult = "";

  void inputCheck(String format) {
    setState(() {
      _checkResult = "Now:    " +
          DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch,
              format: format) +
          "\n" +
          DateUtil.getWeekday(DateTime.now()) +
          "   " +
          DateUtil.getWeekday(DateTime.now(), languageCode: 'zh');
    });
  }

  @override
  void initState() {
    super.initState();
    inputCheck(isZH ? DateFormats.zh_full : DateFormats.full);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      ),
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
                          new Text("Is ZH",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (isZH == true),
                              activeColor: Colors.red,
                              onChanged: (value) {
                                setState(() {
                                  isZH = value;
                                });
                              })
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("DEFAULT",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (_dateFormat == DateFormats.full),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormats.full;
                                    inputCheck(isZH
                                        ? DateFormats.zh_full
                                        : _dateFormat);
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
                          new Text("NORMAL",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (_dateFormat == DateFormats.full),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormats.full;
                                    inputCheck(
                                        isZH ? DateFormats.full : _dateFormat);
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
                          new Text("Y_M_D_H_M",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (_dateFormat == DateFormats.y_mo_d_h_m),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormats.y_mo_d_h_m;
                                    inputCheck(isZH
                                        ? DateFormats.zh_y_mo_d_h_m
                                        : _dateFormat);
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
                          new Text("Y_M_D",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (_dateFormat == DateFormats.y_mo_d),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormats.y_mo_d;
                                    inputCheck(isZH
                                        ? DateFormats.zh_y_mo_d
                                        : _dateFormat);
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
                          new Text("Y_M",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (_dateFormat == DateFormats.y_mo),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormats.y_mo;
                                    inputCheck(isZH
                                        ? DateFormats.zh_y_mo
                                        : _dateFormat);
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
                          new Text("M_D",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (_dateFormat == DateFormats.mo_d),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormats.mo_d;
                                    inputCheck(isZH
                                        ? DateFormats.zh_mo_d
                                        : _dateFormat);
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
                          new Text("M_D_H_M",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (_dateFormat == DateFormats.mo_d_h_m),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormats.mo_d_h_m;
                                    inputCheck(isZH
                                        ? DateFormats.zh_mo_d_h_m
                                        : _dateFormat);
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
                          new Text("H_M_S",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (_dateFormat == DateFormats.h_m_s),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormats.h_m_s;
                                    inputCheck(isZH
                                        ? DateFormats.zh_h_m_s
                                        : _dateFormat);
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
                          new Text("H_M",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          new Checkbox(
                              value: (_dateFormat == DateFormats.h_m),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormats.h_m;
                                    inputCheck(isZH
                                        ? DateFormats.zh_h_m
                                        : _dateFormat);
                                  });
                                }
                              })
                        ],
                      ),
                    )
                  ],
                ),
                new Container(
                  alignment: Alignment.topLeft,
                  height: 66.0,
                  padding: const EdgeInsets.all(10.0),
                  child: new Text(
                    '$_checkResult',
                    textAlign: TextAlign.start,
                    style:
                        new TextStyle(color: Colors.grey[600], fontSize: 14.0),
                  ),
                )
              ],
            ),
          ),
          new ListView(shrinkWrap: true, children: <Widget>[new Text("")])
        ],
      ),
    );
  }
}
