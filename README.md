# Flutter版 WanAndroid App.

## 即将全部开源，敬请期待！
### 一个很攒劲的Flutter项目，拥有较好的项目结构，相对规范的代码···
## 部分预览
resources目录结构
>- |--resources
>    - |-- colors.dart
>    - |-- dimens.dart
>    - |-- strings.dart
>    - |-- styles.dart

colors.dart
```
class ColorT {
  static const Color app_main = Color(0xFF666666);  
  
  static const Color text_dark = Color(0xFF333333);
  static const Color text_normal = Color(0xFF666666);
  static const Color text_gray = Color(0xFF999999);  
  
  static const Color transparent_80 = Color(0x80000000);   
   
  static const Color divider = Color(0xffe5e5e5);
}
```
dimens.dart
```
class Dimens {
  static const double font_sp10 = 10;
  static const double font_sp12 = 12;
  static const double font_sp14 = 14;
  static const double font_sp16 = 16;
  static const double font_sp18 = 18;
  
  static const double gap_dp5 = 5;
  static const double gap_dp10 = 10;
  static const double gap_dp12 = 12;
  static const double gap_dp15 = 15;
  static const double gap_dp16 = 16;
}
```
strings.dart
```
class Ids {
  static const String titleHome = 'title_home';
  static const String titleRepos = 'title_repos';
  static const String titleEvents = 'title_events';
  static const String titleSystem = 'title_system';
}  
  
Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      Ids.titleHome: 'Home',
      Ids.titleRepos: 'Repos',
      Ids.titleEvents: 'Events',
      Ids.titleSystem: 'System',
    }
  },
  'zh': {
    'CN': {
      Ids.titleHome: '主页',
      Ids.titleRepos: '项目',
      Ids.titleEvents: '动态',
      Ids.titleSystem: '体系',
    },
    'HK': {
      Ids.titleHome: '主頁',
      Ids.titleRepos: '項目',
      Ids.titleEvents: '動態',
      Ids.titleSystem: '體系',
    },
    'TW': {
      Ids.titleHome: '主頁',
      Ids.titleRepos: '項目',
      Ids.titleEvents: '動態',
      Ids.titleSystem: '體系',
    }
  }
};
```
styles.dart
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
  
class Decorations {
  static Decoration bottom = BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.33, color: ColorT.divider)));
}
  
class Gaps {
  static Widget hGap5 = new SizedBox(width: Dimens.gap_dp5);
  static Widget hGap10 = new SizedBox(width: Dimens.gap_dp10);
  static Widget hGap15 = new SizedBox(width: Dimens.gap_dp15);

  static Widget vGap5 = new SizedBox(height: Dimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: Dimens.gap_dp10);
  static Widget vGap15 = new SizedBox(height: Dimens.gap_dp15);
}
```


## 旨在打造一款完整的Flutter应用项目。  
包含启动页，引导页，主题色切换，应用国际化多语言，版本更新等功能，项目主框架采用响应式编程RxDart和BLoC，由于目前项目功能尚未完善，代码还有待优化，后续项目重构整理好后，会全部开源出来，敬请期待！欢迎下载体验。  

有关项目最新动态，可以关注App内第一条Hot Item信息。

## 最新开源： 网络框架DioUtil，屏幕适配ScreenUtil 
### [Flutter工具类库 flustars][flustars_github] 
#### v0.1.8(2018.12.29)   
ScreenUtil 屏幕适配更新。  
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
    
    double width = ScreenUtil.getInstance().screenWidth;
    double height = ScreenUtil.getInstance().screenHeight;
    return new Scaffold(
      appBar: new AppBar(),
    );
  }
}  
  
步骤 3
ScreenUtil.getInstance().screenWidth
ScreenUtil.getInstance().screenHeight
ScreenUtil.getInstance().screenDensity
ScreenUtil.getInstance().statusBarHeight
ScreenUtil.getInstance().bottomBarHeight
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
ScreenUtil.getScreenDensity(context); //屏幕 像素密度
ScreenUtil.getStatusBarH(context); //状态栏高度
ScreenUtil.getBottomBarH(context); //bottombar 高度
//屏幕适配相关  
ScreenUtil.getScaleW(context, size); //返回根据屏幕宽适配后尺寸（单位 dp or pt）
ScreenUtil.getScaleH(context, size); //返回根据屏幕高适配后尺寸 （单位 dp or pt）
ScreenUtil.getScaleSp(context, size) ;//返回根据屏幕宽适配后字体尺寸
```
#### v0.1.6(2018.12.20)  
新增网络请求工具DioUtil, 单例模式，可输出请求日志。
```
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

//解析示例 
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

// 网络请求日志  
I/flutter ( 5922): ----------------Http Log----------------
I/flutter ( 5922): [statusCode]:   200
I/flutter ( 5922): [request   ]:   method: GET  baseUrl: http://www.wanandroid.com/  path: lg/collect/list/0/json
I/flutter ( 5922): [reqdata   ]:   null
I/flutter ( 5922): [response  ]:   {data: {curPage: 1, datas: [], offset: 0, over: true, pageCount: 0, size: 20, total: 0}, errorCode: 0, errorMsg: }
```

## 已开源  
① 网络框架  
② 闪屏广告页  
③ 启动页  
④ 引导页  
⑤ 主题色切换    
⑥ 国际化  

## 更新说明 
### v0.1.2   (2018.12.20)
① 网络框架DioUtil  
② 合并[flutter_demos][flutter_demos_github]  

### v0.1.1   (2018.11.19)
① 新增启动页  
② 新增引导页  
③ 修复banner无法点击bug，一些优化  

### v0.1.0   (2018.11.16)
① 堪称完美的UI界面<sup>almost</sup>  
② 支持国际化  
③ 支持更换主题色  

## 传送门

• Dart    常用工具类库    [common_utils](https://github.com/Sky24n/common_utils)  

• Flutter 汉字转拼音    [lpinyin](https://github.com/flutterchina/lpinyin) 

• Flutter 常用工具类库    [flustars](https://github.com/Sky24n/flustars) 

• Flutter 国际化/多语言库 [fluintl](https://github.com/Sky24n/fluintl) 

• rxdart                 [rxdart](https://github.com/ReactiveX/rxdart) 

### APK:[点击下载 v0.1.1](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_wanandroid.apk)

### APK QR:
  ![flutter_wanandroid](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/qrcode.png)

## Screenshot
### 主界面
<img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-11-19_12_41_17.gif" width="240">  

### 闪屏广告页 
<img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-11-23_13_05_08.gif" width="240">  
 
### 引导页 
<img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-11-19_12_35_32.gif" width="240">  

### 启动页
<img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-11-19_12_36_38.gif" width="240">  

### 分类页面
<img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-11-19_22_11_29.gif" width="240"> 

### Web页双击Title滚动到顶部
<img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-11-19_22_12_13.gif" width="240">

### 多语言 
<img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-10-12_00_57_58.gif" width="240">  


## 作者简书，欢迎关注～
 [![jianshu][jianshuSvg]][jianshu]

## Donations
 如果您觉得该项目不错的话，欢迎随意打赏，请作者喝杯咖啡～   
 <img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/alipay.png" width="240">  <img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/wechat.png" width="240">    
 <img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/alipay_reward.png" width="240">


[flutter_wanandroid_github]: https://github.com/Sky24n/flutter_wanandroid
[flutter_wanandroid_apk]: https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_wanandroid.apk
[flutter_wanandroid_qr]: https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/qrcode.png

[flutter_demos_github]: https://github.com/Sky24n/flutter_demos
[flutter_demos_apk]: https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_demos.apk
[flutter_demos_qr]: https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_demos/qrcode.png

[common_utils_github]: https://github.com/Sky24n/common_utils

[flustars_github]: https://github.com/Sky24n/flustars

[jianshuSvg]: https://img.shields.io/badge/简书-@Sky24n-34a48e.svg
[jianshu]: https://www.jianshu.com/u/cbf2ad25d33a



