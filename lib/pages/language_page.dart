import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/blocs/bloc_index.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LanguagePageState();
  }
}

class _LanguagePageState extends State<LanguagePage> {
  List<LanguageModel> _list = new List();

  LanguageModel _currentLanguage;

  @override
  void initState() {
    super.initState();

    _list.add(LanguageModel(StringIds.languageAuto, '', ''));
    _list.add(LanguageModel(StringIds.languageZH, 'zh', 'CH'));
    _list.add(LanguageModel(StringIds.languageTW, 'zh', 'TW'));
    _list.add(LanguageModel(StringIds.languageHK, 'zh', 'HK'));
    _list.add(LanguageModel(StringIds.languageEN, 'en', 'US'));

    _currentLanguage = SpHelper.getLanguageModel();
    if (ObjectUtil.isEmpty(_currentLanguage)) {
      _currentLanguage = _list[0];
    }

    _updateData();
  }

  void _updateData() {
    LogUtil.e('currentLanguage: ' + _currentLanguage.toString());
    String language = _currentLanguage.countryCode;
    for (int i = 0, length = _list.length; i < length; i++) {
      _list[i].isSelected = (_list[i].countryCode == language);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          IntlUtil.getString(context, StringIds.titleLanguage),
          style: new TextStyle(fontSize: 16.0),
        ),
        actions: [
          new Padding(
            padding: EdgeInsets.all(12.0),
            child: new SizedBox(
              width: 64.0,
              child: new RaisedButton(
                textColor: Colors.white,
                color: Colors.indigoAccent,
                child: Text(
                  IntlUtil.getString(context, StringIds.save),
                  style: new TextStyle(fontSize: 12.0),
                ),
                onPressed: () {
                  SpUtil.putString(
                      Constant.keyLanguage,
                      ObjectUtil.isEmpty(_currentLanguage.languageCode)
                          ? ''
                          : json.encode(_currentLanguage));
                  bloc.sendAppEvent(Constant.TYPE_SYS_UPDATE);
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: new ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            LanguageModel model = _list[index];
            return new ListTile(
              title: new Text(
                (model.titleId == StringIds.languageAuto
                    ? IntlUtil.getString(context, model.titleId)
                    : IntlUtil.getString(context, model.titleId,
                        languageCode: 'zh', countryCode: 'CH')),
                style: new TextStyle(fontSize: 13.0),
              ),
              trailing: new Radio(
                  value: true,
                  groupValue: model.isSelected == true,
                  activeColor: Colors.indigoAccent,
                  onChanged: (value) {
                    setState(() {
                      _currentLanguage = model;
                      _updateData();
                    });
                  }),
              onTap: () {
                setState(() {
                  _currentLanguage = model;
                  _updateData();
                });
              },
            );
          }),
    );
  }
}
