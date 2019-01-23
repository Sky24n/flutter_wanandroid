# Flutter版 WanAndroid App.


## 项目已全部开源。欢迎Star&Fork。
本项目包含启动页，引导页，主题色，国际化，Bloc，RxDart。拥有较好的项目结构，比较规范的代码。 App拥有精致的UI界面，统一的交互，侧滑退出，列表和Web界面均提供快速滚动至顶部功能(界面参考[gitme](https://flutterchina.club/app/gm.html))。  
作者初衷是为大家提供一个比较规范的Flutter项目示例。  
有关项目最新动态，可以关注App内第一条Hot Item信息。

[更新说明](./CHANGELOG.md)

### 运行本项目注意！！！
由于在国内访问Flutter有时可能会受到限制，clone项目后，请勿直接packages get，建议运行如下目录行：
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn  
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn  
flutter packages get
```

### v0.1.6
1、主页新增Github Trending，新版本如未显示，请下拉刷新。  
2、新增热门Tab，掘金热门文章！  
3、重构HomePage。  
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/github_trending.png" width="240">  <img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/juejin_hot.png" width="240">

### APK:[点击下载 v0.1.6](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_wanandroid.apk)

### APK QR:
  ![flutter_wanandroid](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/qrcode.png)

### iOS：请自行clone项目代码运行。另外，iOS始终无法打开wanandroid相关url，有知道原因大佬的希望告知下～ 

## App目录结构
>- |--lib
>    - |-- blocs (bloc相关)
>    - |-- common (常用类，例如常量Constant)
>    - |-- data (网络数据层)
>    - |-- db (数据库)
>    - |-- event (事件类)
>    - |-- models (实体类)
>    - |-- resources (资源文件，string，colors，dimens，styles)
>    - |-- ui (界面相关page，dialog，widgets)
>    - |-- utils (工具类)
## data网络数据层
>- |--data
>    - |-- api (url字段)
>    - |-- net (单例DioUtil)
>    - |-- protocol (请求与返回实体类)
>    - |-- repository (接口请求&解析)
### api
```
class WanAndroidApi {
  /// 首页banner http://www.wanandroid.com/banner/json
  static const String BANNER = "banner";
  static const String USER_REGISTER = "user/register"; //注册
  static const String USER_LOGIN = "user/login"; //登录
  static const String USER_LOGOUT = "user/logout"; //退出

  // 拼接url
  static String getPath({String path: '', int page, String resType: 'json'}) {
    StringBuffer sb = new StringBuffer(path);
    if (page != null) {
      sb.write('/$page');
    }
    if (resType != null && resType.isNotEmpty) {
      sb.write('/$resType');
    }
    return sb.toString();
  }
}
```
### 请求与返回实体类 protocol
```
class LoginReq {
  String username;
  String password;

  LoginReq(this.username, this.password);

  LoginReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"username\":\"$username\"");
    sb.write(",\"password\":$password");
    sb.write('}');
    return sb.toString();
  }
}
```
### 接口请求&解析 repository
```
 class WanRepository {
  Future<List<BannerModel>> getBanner() async {
    BaseResp<List> baseResp = await DioUtil().request<List>(
        Method.get, WanAndroidApi.getPath(path: WanAndroidApi.BANNER));
    List<BannerModel> bannerList;
    if (baseResp.code != Constant.STATUS_SUCCESS) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      bannerList = baseResp.data.map((value) {
        return BannerModel.fromJson(value);
      }).toList();
    }
    return bannerList;
  }
}
```

## 资源文件 resources
>- |--resources
>    - |-- colors.dart
>    - |-- dimens.dart
>    - |-- strings.dart
>    - |-- styles.dart

### colors.dart
```
class ColorT {
  static const Color app_main = Color(0xFF666666);  
  
  static const Color text_dark = Color(0xFF333333);
  static const Color text_normal = Color(0xFF666666);
  static const Color text_gray = Color(0xFF999999);  
}
```
### dimens.dart
```
class Dimens {
  static const double font_sp12 = 12;
  static const double font_sp14 = 14;
  static const double font_sp16 = 16;
  
  static const double gap_dp5 = 5;
  static const double gap_dp10 = 10;
}
```
### strings.dart
```
class Ids {
  static const String titleHome = 'title_home';
}  
Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      Ids.titleHome: 'Home',
    }
  },
  'zh': {
    'CN': {
      Ids.titleHome: '主页',
    },
    'HK': {
      Ids.titleHome: '主頁',
    },
    'TW': {
      Ids.titleHome: '主頁',
    }
  }
};
```
### styles.dart
```
class TextStyles {
  static TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    color: ColorT.text_dark,
    fontWeight: FontWeight.bold,
  );
  static TextStyle listContent = TextStyle(
    fontSize: Dimens.font_sp14,
    color: ColorT.text_normal,
  );
  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
    color: ColorT.text_gray,
  );
}
```
### Flutter 国际化相关
[fluintl](https://github.com/Sky24n/fluintl) 是一个为应用提供国际化的库，可快速集成实现应用多语言。该库封装了一个国际化支持类，通过提供统一方法getString(id)获取字符串。
```
// 在MyApp initState配置多语言资源
setLocalizedValues(localizedValues); //配置多语言资源
// 在MaterialApp指定localizationsDelegates和supportedLocales
MaterialApp(  
   home: MyHomePage(),  
   localizationsDelegates: [  
   GlobalMaterialLocalizations.delegate,  
   GlobalWidgetsLocalizations.delegate,  
   CustomLocalizations.delegate //设置本地化代理     
   ],  
   supportedLocales: CustomLocalizations.supportedLocales,//设置支持本地化语言集合     
); 
// 字符串获取
IntlUtil.getString(context, Ids.titleHome);
CustomLocalizations.of(context).getString(StringIds.titleHome);
```

### Flutter 屏幕适配 [ScreenUtil](https://github.com/Sky24n/flustars)
 方案一、不依赖context
```
步骤 1
//如果设计稿尺寸默认配置一致，无需该设置。  配置设计稿尺寸 默认 360.0 / 640.0 / 3.0
setDesignWHD(_designW,_designH,_designD);  
  
步骤 2
// 在MainPageState build 调用MediaQuery.of(context)
class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // 在 MainPageState build 调用 MediaQuery.of(context)
    MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(),
    );
  }
}  
  
步骤 3
ScreenUtil.getInstance().screenWidth
ScreenUtil.getInstance().screenHeight
//屏幕适配相关  
ScreenUtil.getInstance().getWidth(size); //返回根据屏幕宽适配后尺寸（单位 dp or pt）
ScreenUtil.getInstance().getHeight(size); //返回根据屏幕高适配后尺寸 （单位 dp or pt）
ScreenUtil.getInstance().getWidthPx(sizePx); //sizePx 单位px
ScreenUtil.getInstance().getHeightPx(sizePx); //sizePx 单位px
ScreenUtil.getInstance().getSp(fontSize); //返回根据屏幕宽适配后字体尺寸

```
方案二、依赖context
```
//如果设计稿尺寸默认配置一致，无需该设置。  配置设计稿尺寸 默认 360.0 / 640.0 / 3.0
setDesignWHD(_designW,_designH,_designD);  

ScreenUtil.getScreenW(context); //屏幕 宽
ScreenUtil.getScreenH(context); //屏幕 高
//屏幕适配相关  
ScreenUtil.getScaleW(context, size); //返回根据屏幕宽适配后尺寸（单位 dp or pt）
ScreenUtil.getScaleH(context, size); //返回根据屏幕高适配后尺寸 （单位 dp or pt）
ScreenUtil.getScaleSp(context, size) ;//返回根据屏幕宽适配后字体尺寸
```
### Flutter 数据存储  [SpUtil](https://github.com/Sky24n/flustars)
SpUtil : 单例"同步" SharedPreferences 工具类。
项目中为大家提供SpHelper，方便存取实体对象类。
```
// 存储SplashModel实体对象
SplashModel model = new SplashModel();
SpHelper.putObject(Constant.KEY_SPLASH_MODEL, model);  
  
// 获取SplashModel实体对象
SplashModel model = SpHelper.getSplashModel();  
 
class SpHelper {
 // 存储Obj，T 用于区分存储类型
  static void putObject<T>(String key, Object value) {
    switch (T) {
      case int:
        SpUtil.putInt(key, value);
        break;
      case double:
        SpUtil.putDouble(key, value);
        break;
      case bool:
        SpUtil.putBool(key, value);
        break;
      case String:
        SpUtil.putString(key, value);
        break;
      case List:
        SpUtil.putStringList(key, value);
        break;
      default:
        SpUtil.putString(key, value == null ? "" : json.encode(value));
        break;
    }
  }

  static SplashModel getSplashModel() {
    String _splashModel = SpUtil.getString(Constant.KEY_SPLASH_MODEL);
    if (ObjectUtil.isNotEmpty(_splashModel)) {
      Map userMap = json.decode(_splashModel);
      return SplashModel.fromJson(userMap);
    }
    return null;
  }
}
```

## Screenshot
### 主界面
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/home.gif" width="240">  

### 启动页
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/splash.gif" width="240"> 

### 侧滑Back
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/slide_back.gif" width="240"> 

### 快速滚动到顶部
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/scroll_top.gif" width="240"> 

### 分类页面
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/tree.gif" width="240"> 

### 国际化 
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/intl.gif" width="240">  

### 主题色 
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/theme_color.gif" width="240">  

### 闪屏广告页 
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/2018-11-23_13_05_08.gif" width="240">  
 
### 引导页 
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/2018-11-19_12_35_32.gif" width="240">  

### Big Thanks
① 感谢鸿洋大佬提供的[开源api](http://www.wanandroid.com/blog/show/2)  
② 界面参考[gitme](https://flutterchina.club/app/gm.html)  
③ [Github Trending Api](https://github.com/huchenme/github-trending-api)   

### 开源库
1. Dart常用工具类库[common_utils][common_utils_github]  
   该库包含TimerUtil（倒计时，定时任务），TimelineUtil（时间轴），DateUtil（日期格式化），RegexUtil（正则验证手机号，身份证，邮箱等等），RegexUtil（正则验证手机号，身份证，邮箱等等），NumUtil（保留x位小数, 精确加、减、乘、除, 防止精度丢失），MoneyUtil（元转分，分转元），ObjectUtil（判空），LogUtil（简单封装打印日志）。  
   如果你有不错的纯dart工具类或对已有对工具类有更好的优化建议，欢迎PR，大家一起维护～  
2. Flutter常用工具类库[flustars][flustars_github]  
   该库包含SpUtil（单例"同步" SharedPreferences 工具类），ScreenUtil（屏幕适配），WidgetUtil（Widget渲染监听，获取Widget宽高，在屏幕上的坐标）。  
   如果你有不错的Flutter工具类或对已有对工具类有更好的优化建议，欢迎PR，大家一起维护～   
3. 汉字转拼音库[lpinyin](https://github.com/flutterchina/lpinyin)  
4. 国际化/多语言库[fluintl](https://github.com/Sky24n/fluintl)  
5. UI组件库[flukit](https://github.com/flutterchina/flukit)  
6. 网络请求[dio](https://github.com/flutterchina/dio)  
7. 图片加载[cached_network_image](https://github.com/renefloor/flutter_cached_network_image)  
8. 上拉加载和下拉刷新[pull_to_refresh](https://github.com/peng8350/flutter_pulltorefresh)  
9. [url_launcher](https://github.com/flutter/plugins/tree/master/packages/url_launcher)  
10. 点赞效果[LikeButton](https://github.com/yumi0629/LikeButton)  
11. 安卓webview增加滚动监听[webview_flutter](https://github.com/Sky24n/plugins/tree/master/packages/webview_flutter)  


## 关于作者，欢迎关注～
 [![jianshu][jianshuSvg]][jianshu]   [![juejin][juejinSvg]][juejin]  

### 项目问题汇总
Q1：Flutter国际化系统切换iOS不生效问题？  
A1：在Xcode项目Localizations下添加支持语言即可，[原文](https://stanzhai.site/blog/post/stanzhai/Flutter国际化设置在iOS设备上不生效的问题)。


[flutter_wanandroid_github]: https://github.com/Sky24n/flutter_wanandroid
[flutter_wanandroid_apk]: https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_wanandroid.apk
[flutter_wanandroid_qr]: https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/qrcode.png

[flutter_demos_github]: https://github.com/Sky24n/flutter_demos
[flutter_demos_apk]: https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_demos.apk
[flutter_demos_qr]: https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_demos/qrcode.png

[common_utils_github]: https://github.com/Sky24n/common_utils

[flustars_github]: https://github.com/Sky24n/flustars

[jianshuSvg]: https://img.shields.io/badge/简书-@Sky24n-536dfe.svg
[jianshu]: https://www.jianshu.com/u/cbf2ad25d33a

[juejinSvg]: https://img.shields.io/badge/掘金-@Sky24n-536dfe.svg
[juejin]: https://juejin.im/user/5b9e8a92e51d453df0440422

