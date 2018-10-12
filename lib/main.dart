import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/pages/page_index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Locale _locale;

  @override
  void initState() {
    super.initState();

//    setLocalizedSimpleValues(localizedSimpleValues);
    setLocalizedValues(localizedValues);

    _initAsync();
    _initListener();
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _loadLocale();
  }

  void _initListener() {
    NoticeTest.getInstance().ctrl.stream.listen((_) {
      _loadLocale();
    });
  }

  void _loadLocale() {
    setState(() {
      LanguageModel model = SpHelper.getLanguageModel();
      if (model != null) {
        LogUtil.e('LanguageModel: ' + model.toString());
        _locale = new Locale(model.languageCode, model.countryCode);
      } else {
        _locale = null;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    NoticeTest.getInstance().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MainPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF333333),
        indicatorColor: Colors.white,
      ),
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
    );
  }
}
