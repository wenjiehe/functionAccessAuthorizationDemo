# functionAccessAuthorizationDemo


## 功能请求授权

### 位置

1. 框架

```
CoreLocation.framework

#import <CoreLocation/CoreLocation.h>
```

2. 权限

```
必须在info.plist文件中添加
//用于应用在后台时获取用户位置,iOS 11之后，只添加这个就可以了
NSLocationAlwaysAndWhenInUseUsageDescription
//"使用应用期间"定位权限:用于应用在前台时获取用户位置
NSLocationWhenInUseUsageDescription
//"始终"定位权限:始终使用定位服务,iOS 10及之前
NSLocationAlwaysUsageDescription
//访问用户位置信息:用于macOS应用
NSLocationUsageDescription

//注意：在iOS 11和iOS 12中使用位置服务所需的授权
Service                                 When In Use    Always 
----------------------------------------------------------------
//标准位置服务:可以获取位置信息，根据精度设置跟踪位置变化
Standard location Service               Supported      Supported
----------------------------------------------------------------
//重大位置改变服务:只有当设备的位置有大的改变时，比如移动500米或者更远，才会提交更新请求
//使用这个服务，必须使用NSLocationAlwaysUsageDescription
Significant-change location service     Not available  Supported
----------------------------------------------------------------
//访问服务
Visits Service                          Not available  Supported
----------------------------------------------------------------
//区域监听
Region monitoring                       Not available  Supported
----------------------------------------------------------------
//iBeacon范围:用于室内定位（车库、商场）、智能打卡
iBeacon ranging                         Supported      Supported
----------------------------------------------------------------
//方向服务
Heading service                         Supported      Supported
----------------------------------------------------------------
//地理编码服务
Geocoding service                       Supported      Supported


```

3. 系统

```
tvOS
    仅支持使用时授权
watchOS
    仅支持使用时授权
macOS
    支持使用时和始终授权
Mac Catalyst
    支持使用时和始终授权
iOS
    支持使用时和始终授权
```

4. 通知

```
//当用户的设备进入或退出指定的地理区域时，触发一个通知。
//注意：当使用这个通知的时候，必须具有NSLocationWhenInUseUsageDescription授权
UNLocationNotificationTrigger
```

### 推送通知

### 录音

### 相机

### 相册

### 通讯录

### 日历

### 语音

### 参考资料

[apple-位置](https://developer.apple.com/documentation/corelocation/choosing_the_location_services_authorization_to_request?language=objc)
