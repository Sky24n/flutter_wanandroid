# Flutter版 WanAndroid App.

本项目包含启动页，引导页，主题色，国际化，Bloc，RxDart。拥有较好的项目结构，比较规范的代码。 App拥有精致的UI界面，统一的交互，侧滑退出，列表和Web界面均提供快速滚动至顶部功能。  

有关项目最新动态，可以关注App内第一条Hot Item信息。

### 运行本项目注意！！！
本项目运行环境要求! Flutter Version (beta v1.10.7)
```
ps：作者Futter版本
[✓] Flutter (Channel beta, v1.10.7, locale zh-Hans-CN)

ps：以上是最低支持版本，如不是，请自行升级！

flutter upgrade
```
由于在国内访问Flutter有时可能会受到限制，clone项目后，请勿直接packages get，建议运行如下目录行：
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn  
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn  
flutter packages get
flutter run --release
```

### 近期github无法预览图片和外链下载。
1、App无法下载问题   

这里提供最新下载方式。[App链接](https://github.com/Sky24n/Doc)
  
2、无法查看截图，大家可以去简书或掘金查看！  
  
[简书地址](https://www.jianshu.com/p/be0107298bc5)    

[掘金地址](https://juejin.im/post/5c380b336fb9a049fd100eff)


### [开源详情！！！](https://github.com/Sky24n/flutter_wanandroid/issues/66)  
一、Flutter常用工具类库全面升级 [flustars](https://github.com/Sky24n/flustars)
1. SpUtil 全面支持读取对象，对象列表。无需通过SpHelper二次转换。
2. ScreenUtil 兼容横/纵屏适配。  
3. DirectoryUtil 新增文件目录工具类。   
   
二、Flutter全局屏幕适配库 [auto_size](https://github.com/flutterchina/auto_size)   

三、基础组件库[base_library](https://github.com/Sky24n/FlutterRepos)，方便多个项目共用。  
另外附送[login_demo](https://github.com/Sky24n/FlutterRepos/tree/master/login_demo)示例！关于App启动时，未登录跳登录页，已登录进主页。

### [更新说明](./CHANGELOGS.md)
### v0.2.5 (2019.11.16)
1.基础库升级。  
2.一些优化~。

### v0.2.2 (2019.07.02)
1.基础库升级。  
2.修复OPPO R15详情页问题。  
3.一些优化~。

### v0.2.1 (2019.05.08)
1.新增登录/注册。  
2.新增收藏功能。  
3.一些优化~。  

温馨提醒：  
   ① 默认主题色修改为deepPurpleAccent，与登录/注册页面元素保持一致。  
   ② 设置新增升级提示次数，可关闭升级提醒，但超过5个版本未升级需要下载最新版。  
   ③ 快速滚动至顶部按钮展示逻辑优化。  
  

<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/login.png" width="240">  <img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/register.png" width="240">  <img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/collect.png" width="240">


### v0.2.0 (2019.03.29)   
1.新增分享～。  
2.新增网络状态页。

<img src="https://gitee.com/uploads/images/2019/0506/004900_cff8f8c0_506864.png" width="240">  <img src="https://gitee.com/uploads/images/2019/0506/004900_d413711d_506864.png" width="240">  <img src="https://gitee.com/uploads/images/2019/0506/004901_f292f8b8_506864.png" width="240">

### v0.1.9 (2019.03.16)   
1.闪屏页支持视频。  
2.支持App应用内升级。  
3.玩安卓Api升级为https。   
4.Flutter Demos 新增 获取图片尺寸示例。  
  
温馨提醒：  
   ① 为了方便大家体验应用内升级，服务端版本号为：v0.2.0，Apk版本始终为v0.1.9。  
   ② 由于Apk文件是放在Github上面的，可能下载速度会比较慢。  
   ③ 为了保护掘金作者原创文章，热门文章修改为从第二页开始获取。  
  
<img src="https://gitee.com/uploads/images/2019/0506/004900_5e0bd537_506864.png" width="240">  <img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/splash_video.gif" width="240">  <img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/upgrade_download.gif" width="240">    

### 安卓Apk
点击下载  [新版v0.2.5](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_wanandroid.apk)   
   
扫码下载 新版v0.2.5  
![flutter_wanandroid](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/qrcode.png)
  
### iOS：请自行clone项目代码运行。

## App目录结构
>- |--lib
>    - |-- blocs (bloc相关)
>    - |-- common (常用类，例如常量Constant)
>    - |-- data (网络数据层)
>    - |-- db (数据库)
>    - |-- demos (flutter demos)
>    - |-- event (事件类)
>    - |-- models (实体类)
>    - |-- res (资源文件，string，colors，dimens，styles)
>    - |-- ui (界面相关page，dialog，widgets)
>    - |-- utils (工具类)

### data网络数据层
>- |--data
>    - |-- api (url字段)
>    - |-- net (单例DioUtil)
>    - |-- protocol (请求与返回实体类)
>    - |-- repository (接口请求&解析)

### api
```dart
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
### 网络请求工具类 单例[DioUtil](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/data/net/dio_util.dart)(基于v1.0.13，仅供参考～)
```dart
// 打开debug模式.
DioUtil.openDebug();   
  
// 配置网络参数.
Options options = DioUtil.getDefOptions();
options.baseUrl = "http://www.wanandroid.com/";
HttpConfig config = new HttpConfig(options: options);
DioUtil().setConfig(config);
  
// 两种单例请求方式.
DioUtil().request<List>(Method.get, "banner/json");
DioUtil.getInstance().request(Method.get, "banner/json");
  
//示例
LoginReq req = new LoginReq('username', 'password');
DioUtil().request(Method.post, "user/login",data: req.toJson());
  
//示例
FormData formData = new FormData.from({
      "username": "username",
      "password": "password",
    });
DioUtil().requestR(Method.post, "user/login",data: rformData);

```  
### 请求与返回实体类 protocol
```dart
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
```dart
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

## 资源文件 res
>- |--res
>    - |-- colors.dart
>    - |-- dimens.dart
>    - |-- strings.dart
>    - |-- styles.dart

### colors.dart
```dart
class Colours {
  static const Color app_main = Color(0xFF666666);  
  
  static const Color text_dark = Color(0xFF333333);
  static const Color text_normal = Color(0xFF666666);
  static const Color text_gray = Color(0xFF999999);  
}
```
### dimens.dart
```dart
class Dimens {
  static const double font_sp12 = 12;
  static const double font_sp14 = 14;
  static const double font_sp16 = 16;
  
  static const double gap_dp5 = 5;
  static const double gap_dp10 = 10;
}
```
### strings.dart
```dart
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
```dart
class TextStyles {
  static TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.text_dark,
    fontWeight: FontWeight.bold,
  );
  static TextStyle listContent = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_normal,
  );
  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray,
  );
}
//  间隔
class Gaps {
  // 水平间隔
  static Widget hGap5 = new SizedBox(width: Dimens.gap_dp5);
  static Widget hGap10 = new SizedBox(width: Dimens.gap_dp10);
  // 垂直间隔
  static Widget vGap5 = new SizedBox(height: Dimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: Dimens.gap_dp10);
}
```
### Flutter 国际化相关 [fluintl](https://github.com/Sky24n/fluintl)
fluintl是一个为应用提供国际化的库，可快速集成实现应用多语言。该库封装了一个国际化支持类，通过提供统一方法getString(id)获取字符串。
```dart
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

// 支持复用。替换字符串格式要求：'%\${index}\$s' ，{index} 第几个参数，从0开始。
Ids.click_times: '%\$0\$s点击了%\$1\$s次',   
IntlUtil.getString(context, Ids.click_times, params: ['Tom', '$_counter'])  
// print: Tom点击了0次
```

### Flutter 屏幕适配 [ScreenUtil](https://github.com/Sky24n/flustars) 
 方案一、不依赖context
```dart
// 步骤1
// 如果设计稿尺寸默认配置一致，无需该设置。  配置设计稿尺寸 默认 360.0 / 640.0 / 3.0
setDesignWHD(_designW,_designH,_designD);  
  
// 步骤2
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
  
// 步骤3
ScreenUtil.getInstance().screenWidth
ScreenUtil.getInstance().screenHeight
//屏幕适配相关  
ScreenUtil.getInstance().getWidth(size); //返回根据屏幕宽适配后尺寸（单位 dp or pt）
ScreenUtil.getInstance().getHeight(size); //返回根据屏幕高适配后尺寸 （单位 dp or pt）
ScreenUtil.getInstance().getWidthPx(sizePx); //sizePx 单位px
ScreenUtil.getInstance().getHeightPx(sizePx); //sizePx 单位px
ScreenUtil.getInstance().getSp(fontSize); //返回根据屏幕宽适配后字体尺寸
  
double adapterSize = ScreenUtil.getInstance().getAdapterSize(100);
```
方案二、依赖context
```dart
//如果设计稿尺寸默认配置一致，无需该设置。  配置设计稿尺寸 默认 360.0 / 640.0 / 3.0
setDesignWHD(_designW,_designH,_designD);  

ScreenUtil.getScreenW(context); //屏幕 宽
ScreenUtil.getScreenH(context); //屏幕 高
//屏幕适配相关  
ScreenUtil.getScaleW(context, size); //返回根据屏幕宽适配后尺寸（单位 dp or pt）
ScreenUtil.getScaleH(context, size); //返回根据屏幕高适配后尺寸 （单位 dp or pt）
ScreenUtil.getScaleSp(context, size) ;//返回根据屏幕宽适配后字体尺寸
  
double adapterSize = ScreenUtil.getAdapterSizeCtx(context, 100)
```
### Flutter 数据存储  [SpUtil](https://github.com/Sky24n/flustars)
单例"同步" SharedPreferences 工具类。  
支持get获取默认参数、支持存储实体对象、支持存储实体对象数组。
```dart
    // 等待Sp初始化完成。
    await SpUtil.getInstance();
    
    SpUtil.getString('key', defValue: '');
    SpUtil.getInt('key', defValue: 0);
  
    /// save object example.
    /// 存储实体对象示例。
    City city = new City();
    city.name = "成都市";
    SpUtil.putObject("loc_city", city);
  
    City hisCity = SpUtil.getObj("loc_city", (v) => City.fromJson(v)); 
    print("thll Str: " + (hisCity == null ? "null" : hisCity.toString()));
  
    /// save object list example.
    /// 存储实体对象List示例。
    List<City> list = new List();
    list.add(new City(name: "成都市"));
    list.add(new City(name: "北京市"));
    SpUtil.putObjectList("loc_city_list", list);
  
    List<City> _cityList = SpUtil.getObjList("loc_city_list", (v) => City.fromJson(v));
    print("thll List: " + (_cityList == null ? "null" : _cityList.toString()));
```

## Flutter Demos 
>- |--demos
>    - |-- city_select_page.dart 城市列表(索引&悬停)示例
>    - |-- date_page.dart 日期格式化示例
>    - |-- image_size_page.dart 获取图片尺寸示例
>    - |-- money_page.dart 金额(元转分/分转元)示例
>    - |-- pinyin_page.dart 汉字转拼音示例
>    - |-- regex_page.dart 正则工具类示例
>    - |-- round_portrait_page.dart 圆形圆角头像示例
>    - |-- timeline_page.dart 时间轴示例
>    - |-- timer_page.dart 倒计时/定时任务示例
>    - |-- widget_page.dart 获取Widget尺寸/屏幕坐标示例


## Screenshot
### 主界面
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/home.gif" width="240">  

### 启动页
<img src="https://gitee.com/uploads/images/2019/0506/005059_fa3a5968_506864.gif" width="240"> 

### 侧滑Back
<img src="https://gitee.com/uploads/images/2019/0506/004903_44c9266f_506864.gif" width="240"> 

### 快速滚动到顶部
<img src="https://gitee.com/uploads/images/2019/0506/004903_0837c169_506864.gif" width="240"> 

### 分类页面
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/tree.gif" width="240"> 

### 国际化 
<img src="https://gitee.com/uploads/images/2019/0506/004906_f1f1147e_506864.gif" width="240">  

### 主题色 
<img src="https://gitee.com/uploads/images/2019/0506/004907_498b0fb8_506864.gif" width="240">  

### 闪屏广告页 
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/2018-11-23_13_05_08.gif" width="240">  
 
### 引导页 
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/2018-11-19_12_35_32.gif" width="240">  

### Big Thanks
① 感谢鸿洋大佬提供的[开源api](http://www.wanandroid.com/blog/show/2)  
② 界面参考[gitme](https://flutterchina.club/app/gm.html)  
③ [Github Trending Api](https://github.com/huchenme/github-trending-api)   
④ [Streams-Block-Reactive-Programming-in-Flutter](https://github.com/boeledi/Streams-Block-Reactive-Programming-in-Flutter) 

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
12. 城市列表[azlistview](https://github.com/flutterchina/azlistview)    

### 项目问题汇总
Q1：Flutter国际化系统切换iOS不生效问题？  
A1：在Xcode项目Localizations下添加支持语言即可，[原文](https://stanzhai.site/blog/post/stanzhai/Flutter国际化设置在iOS设备上不生效的问题)。

### 关于作者
GitHub : [Sky24n](https://github.com/Sky24n)  
简书 &nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://www.jianshu.com/u/cbf2ad25d33a)  
掘金 &nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://juejin.im/user/5b9e8a92e51d453df0440422/posts)  
Pub &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://pub.flutter-io.cn/packages?q=email%3A863764940%40qq.com)    
Email &nbsp;&nbsp;: 863764940@qq.com  
⭐⭐⭐ 如果您觉得本项目不错的话，来个star支持下作者吧! ⭐⭐⭐  
关于项目任何问题请提交[issues](https://github.com/Sky24n/flutter_wanandroid/issues)，私发QQ邮件将不再回复～

Flutter版玩安卓 [flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)  
  
[![GitHub stars](https://img.shields.io/github/stars/Sky24n/flutter_wanandroid.svg?style=social&label=Star)](https://github.com/Sky24n/flutter_wanandroid) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/flutter_wanandroid.svg?style=social&label=Fork)](https://github.com/Sky24n/flutter_wanandroid) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/flutter_wanandroid.svg?style=social&label=Watch)](https://github.com/Sky24n/flutter_wanandroid)  
  
Flutter仿滴滴出行 [GreenTravel](https://github.com/Sky24n/GreenTravel)  
  
[![GitHub stars](https://img.shields.io/github/stars/Sky24n/GreenTravel.svg?style=social&label=Star)](https://github.com/Sky24n/GreenTravel) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/GreenTravel.svg?style=social&label=Fork)](https://github.com/Sky24n/GreenTravel) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/GreenTravel.svg?style=social&label=Watch)](https://github.com/Sky24n/GreenTravel)  
  
Flutter常用工具类库 [flustars](https://github.com/Sky24n/flustars)  
  
[![GitHub stars](https://img.shields.io/github/stars/Sky24n/flustars.svg?style=social&label=Star)](https://github.com/Sky24n/flustars) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/flustars.svg?style=social&label=Fork)](https://github.com/Sky24n/flustars) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/flustars.svg?style=social&label=Watch)](https://github.com/Sky24n/flustars)  
  
Dart常用工具类库 [common_utils](https://github.com/Sky24n/common_utils)  
  
[![GitHub stars](https://img.shields.io/github/stars/Sky24n/common_utils.svg?style=social&label=Star)](https://github.com/Sky24n/common_utils) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/common_utils.svg?style=social&label=Fork)](https://github.com/Sky24n/common_utils) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/common_utils.svg?style=social&label=Watch)](https://github.com/Sky24n/common_utils)  
  
Flutter城市列表 [azlistview](https://github.com/flutterchina/azlistview)  
  
[![GitHub stars](https://img.shields.io/github/stars/flutterchina/azlistview.svg?style=social&label=Star)](https://github.com/flutterchina/azlistview) [![GitHub forks](https://img.shields.io/github/forks/flutterchina/azlistview.svg?style=social&label=Fork)](https://github.com/flutterchina/azlistview) [![GitHub watchers](https://img.shields.io/github/watchers/flutterchina/azlistview.svg?style=social&label=Watch)](https://github.com/flutterchina/azlistview)  
  
Flutter汉字转拼音库 [lpinyin](https://github.com/flutterchina/lpinyin)  
  
[![GitHub stars](https://img.shields.io/github/stars/flutterchina/lpinyin.svg?style=social&label=Star)](https://github.com/flutterchina/lpinyin) [![GitHub forks](https://img.shields.io/github/forks/flutterchina/lpinyin.svg?style=social&label=Fork)](https://github.com/flutterchina/lpinyin) [![GitHub watchers](https://img.shields.io/github/watchers/flutterchina/lpinyin.svg?style=social&label=Watch)](https://github.com/flutterchina/lpinyin)  
  
Flutter国际化库 [fluintl](https://github.com/Sky24n/fluintl)  
  
[![GitHub stars](https://img.shields.io/github/stars/Sky24n/fluintl.svg?style=social&label=Star)](https://github.com/Sky24n/fluintl) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/fluintl.svg?style=social&label=Fork)](https://github.com/Sky24n/fluintl) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/fluintl.svg?style=social&label=Watch)](https://github.com/Sky24n/fluintl)  




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
  
