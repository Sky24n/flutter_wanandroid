import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class RegexUtilPage extends StatefulWidget {
  final String title;

  RegexUtilPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return new _RegexUtilPageState();
  }
}

class _RegexUtilPageState extends State<RegexUtilPage> {
  bool isOpen = false;

  String _inputText = "";
  String _checkResult = "";

  String regexType = "";

  static const String regexMobileSimple = "MobileSimple";
  static const String regexMobileExact = "MobileExact";
  static const String regexTel = "Tel";
  static const String regexIdCard15 = "IdCard15";
  static const String regexIdCard18 = "IdCard18";
  static const String regexEmail = "Email";
  static const String regexUrl = "Url";
  static const String regexZh = "Zh";
  static const String regexDate = "Date";
  static const String regexIp = "Ip";

  @override
  void initState() {
    super.initState();
    regexType = regexMobileSimple;
  }

  void inputCheck(String input) {
    _inputText = input;
    bool isCorrent = false;
    switch (regexType) {
      case regexMobileSimple:
        isCorrent = RegexUtil.isMobileSimple(input);
        break;
      case regexMobileExact:
        isCorrent = RegexUtil.isMobileExact(input);
        break;
      case regexTel:
        isCorrent = RegexUtil.isTel(input);
        break;
      case regexIdCard15:
        isCorrent = RegexUtil.isIDCard15(input);
        break;
      case regexIdCard18:
        isCorrent = RegexUtil.isIDCard18(input);
        break;
      case regexEmail:
        isCorrent = RegexUtil.isEmail(input);
        break;
      case regexUrl:
        isCorrent = RegexUtil.isURL(input);
        break;
      case regexZh:
        isCorrent = RegexUtil.isZh(input);
        break;
      case regexDate:
        isCorrent = RegexUtil.isDate(input);
        break;
      case regexIp:
        isCorrent = RegexUtil.isIP(input);
        break;
    }

    setState(() {
      _checkResult = regexType + " is   " + isCorrent.toString();
    });
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
                            new Text(regexMobileSimple,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexMobileSimple),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexMobileSimple;
                                      inputCheck(_inputText);
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
                            new Text(regexMobileExact,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexMobileExact),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexMobileExact;
                                      inputCheck(_inputText);
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
                            new Text(regexTel,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexTel),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexTel;
                                      inputCheck(_inputText);
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
                            new Text(regexDate,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexDate),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexDate;
                                      inputCheck(_inputText);
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
                            new Text(regexIp,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexIp),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexIp;
                                      inputCheck(_inputText);
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
                            new Text(regexIdCard15,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexIdCard15),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexIdCard15;
                                      inputCheck(_inputText);
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
                            new Text(regexIdCard18,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexIdCard18),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexIdCard18;
                                      inputCheck(_inputText);
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
                            new Text(regexEmail,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexEmail),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexEmail;
                                      inputCheck(_inputText);
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
                            new Text(regexUrl,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexUrl),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexUrl;
                                      inputCheck(_inputText);
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
                            new Text(regexZh,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey[700])),
                            new Checkbox(
                                value: (regexType == regexZh),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      regexType = regexZh;
                                      inputCheck(_inputText);
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
                      style: new TextStyle(
                          fontSize: 14.0, color: Colors.grey[900]),
                      decoration: new InputDecoration(
                          hintText: "请输入...",
                          hintStyle: new TextStyle(fontSize: 14.0)),
                      onChanged: (value) {
                        inputCheck(value);
                      },
                    ),
                  ),
                  new Container(
                    alignment: Alignment.topLeft,
                    height: 66.0,
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      '$_checkResult',
                      textAlign: TextAlign.start,
                      style: new TextStyle(
                          color: Colors.grey[600], fontSize: 14.0),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
