# 一款精致的Flutter版 Wanandroid App.
## 旨在打造一款完整的Flutter应用项目。  
包含启动页，引导页，主题色切换，应用国际化多语言，版本更新等功能，项目主框架采用响应式编程RxDart和BLoC，由于目前项目功能尚未完善，代码还有待优化，后续项目重构整理好后，会全部开源出来，敬请期待！欢迎下载体验。  

有关项目最新动态，可以关注App内第一条Hot Item信息。

##最新开源： 网络框架DioUtil，屏幕适配ScreenUtil 
### [Flutter工具类库 flustars][flustars_github] 
v0.1.6(2018.12.20)  
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

// 网络请求日志  
I/flutter ( 5922): ----------------Http Log----------------
I/flutter ( 5922): [statusCode]:   200
I/flutter ( 5922): [request   ]:   method: GET  baseUrl: http://www.wanandroid.com/  path: lg/collect/list/0/json
I/flutter ( 5922): [reqdata   ]:   null
I/flutter ( 5922): [response  ]:   {data: {curPage: 1, datas: [], offset: 0, over: true, pageCount: 0, size: 20, total: 0}, errorCode: 0, errorMsg: }
```

v0.1.5(2018.12.14)  
ScreenUtil 新增屏幕适配，不依赖context
```
//如果设计稿尺寸与默认配置一致，无需该设置。  配置设计稿尺寸 默认 360.0 / 640.0 / 3.0
setDesignWHD(_designW,_designH,_designD);

//返回根据屏幕宽适配后尺寸（单位 dp or pt）
ScreenUtil.getInstance().getWidth(100.0);  
ScreenUtil().getWidth(100.0); 

//返回根据屏幕高适配后尺寸（单位 dp or pt）
ScreenUtil.getInstance().getHeight(100.0); 
ScreenUtil().getHeight(100.0);  

//返回根据屏幕宽适配后字体尺寸
ScreenUtil.getInstance().getSp(12.0); 
ScreenUtil().getSp(100.0);   
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



