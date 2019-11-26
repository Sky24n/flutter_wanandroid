# 更新说明
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
  

### v0.2.0 (2019.03.29)   
1.新增分享～。  
2.新增网络状态页。  

### v0.1.9 (2019.03.16)
1.闪屏页支持视频。  
2.支持App应用内升级。  
3.玩安卓Api升级为https。   
4.Flutter Demos 新增 获取图片尺寸示例。  
  
温馨提醒：  
   ① 为了方便大家体验应用内升级，服务端版本号为：v0.2.0，Apk版本始终为v0.1.9。  
   ② 由于Apk文件是放在Github上面的，可能下载速度会比较慢。  
   ③ 为了保护掘金作者原创文章，热门文章修改为从第二页开始获取。 

### v0.1.7   (2019.03.04)
1、App新Logo。   
2、闪屏页优化。  
3、升级WebView，新增loading，点击TitleBar返回可回退网页。  
4、新增内置浏览器，修复oppo R15, R11st无法查看详情页，若其他手机无法查看详情页，请自行修改为内置浏览器。  

### v0.1.6   (2019.01.18)
1、主页新增Github Trending，新版本如未显示，请下拉刷新。  
2、新增热门Tab，掘金热门文章！  
3、重构HomePage。  

### v0.1.3   (2019.01.09)
① 新WebView 重构项目。

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

## 其他 
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
    if (baseResp.code != Constant.status_success) {
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


 [flutter_demos_github]: https://github.com/Sky24n/flutter_demos
 [flustars_github]: https://github.com/Sky24n/flustars