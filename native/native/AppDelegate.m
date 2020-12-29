//
//  AppDelegate.m
//  native
//
//  Created by heshenghui on 2020/12/16.
//  Copyright © 2020 Company. All rights reserved.
//

#import "AppDelegate.h"
#import <Flutter/Flutter.h>
#import <flutter_boost/FlutterBoost.h>
#import "PlatformRouterImp.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    PlatformRouterImp *router = [PlatformRouterImp new];
    
  UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    router.navigationController = nav;
    
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router onStart:^(FlutterEngine * _Nonnull engine) {
        // 注册MethodChannel，监听flutter侧的getPlatformVersion调用
        FlutterMethodChannel * flutterMethodChannel = [FlutterMethodChannel methodChannelWithName:@"flutter_native_channel" binaryMessenger:engine.binaryMessenger];
        [flutterMethodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            NSString * method = call.method;
            if ([method isEqualToString:@"getPlatformVersion"]) {
                NSString *sysVersion = [[UIDevice currentDevice] systemVersion];
                result(sysVersion);
            }else{
                result(FlutterMethodNotImplemented);
            }
        }];
        
    }];
       self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
       self.window.rootViewController = router.navigationController;
       [self.window makeKeyAndVisible];
    
    return YES;
}



@end
