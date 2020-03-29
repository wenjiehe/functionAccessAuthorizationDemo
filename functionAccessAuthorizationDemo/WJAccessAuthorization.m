//
//  WJAccessAuthorization.m
//  functionAccessAuthorizationDemo
//
//  Created by 贺文杰 on 2020/3/28.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import "WJAccessAuthorization.h"
#import <CoreLocation/CoreLocation.h>

@interface WJAccessAuthorization ()<CLLocationManagerDelegate>

@property(nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation WJAccessAuthorization

+ (void)locationAuthorization
{
    //判断定位服务是否可用
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务不可用");
    }
    WJAccessAuthorization *aa = [[WJAccessAuthorization alloc] init];
    aa.locationManager = [[CLLocationManager alloc] init];
    aa.locationManager.delegate = aa;
    //app在后台也可以持续定位
//    [aa.locationManager requestAlwaysAuthorization];
    //在app打开期间使用定位权限
    [aa.locationManager requestWhenInUseAuthorization];
    CLAuthorizationStatus locationStatus = [CLLocationManager authorizationStatus];
    [WJAccessAuthorization setupLocationAlert:locationStatus];
}

+ (void)setupLocationAlert:(CLAuthorizationStatus)locationStatus
{
    switch (locationStatus) {
        case kCLAuthorizationStatusNotDetermined:
        {
            //还未请求过权限，一般是APP首次安装，然后第一次请求权限的时候才会出现这个状态，然后需要主动触发权限请求
        }
            break;
        case kCLAuthorizationStatusRestricted:
        {
            //拒绝状态
        }
            break;
        case kCLAuthorizationStatusDenied:
        {
            //用户已允许状态
        }
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        {
            //始终定位
        }
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        {
            //使用应用期间定位，不能在后台使用定位
        }
            break;
        default:
            break;
    }
}

//当此应用程序的授权状态更改时调用
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status API_AVAILABLE(ios(4.2), macos(10.7))
{
    [WJAccessAuthorization setupLocationAlert:status];
}

@end
