//
//  XRNComponent.m
//  reactnative_multibundler
//
//  Created by ctrip on 2018/10/31.
//  Copyright © 2018年 Facebook. All rights reserved.
//
#import <React/RCTBridge+Private.h>
#import "RCTBridge.h"

#import "XRNViewController.h"
#import "XRNComponent.h"
@interface XRNComponent ()
{
  RCTBridge *bridge;
}
@end

@implementation XRNComponent

+ (instancetype)sharedInstance
{
  static XRNComponent *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[XRNComponent alloc] init];
    [instance initRNEnv:nil];
  });
  
  return instance;
}
- (void)initRNEnv:(NSDictionary *)launchOptions {
    NSBundle * bundle = [NSBundle bundleForClass:self.class];
    NSURL *jsCodeLocation;
    //jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"platform.ios" withExtension:@"bundle"];
    jsCodeLocation = [bundle URLForResource:@"platform.ios" withExtension:@"bundle"];
    //NSString *js = [bundle pathForResource:@"qframework.framework/platform.ios.bundle" ofType:nil];
    NSLog(@"JSview class :%@",[bundle resourceURL]);
    NSLog(@"JSfile location:%@",[jsCodeLocation absoluteString]);
    bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation
                                 moduleProvider:nil
                                  launchOptions:launchOptions];
  //NSLog(@"JSfile location:%@",js);
}
- (UIViewController*) createRNVewController:(NSString*) moduleName bundleName:(NSString*)bundleName{
    XRNViewController* controller = [[XRNViewController alloc] init];
    [controller attachRNBridge:bridge moduleName:moduleName bundleName:bundleName];
    return controller;
}
+ (void)openRNPage:(UIViewController*) parentViewController moduleName:(NSString*)moduleName bundleName:(NSString*)bundleName{
    UIViewController* controller = [[XRNComponent sharedInstance] createRNVewController:moduleName bundleName:bundleName];
    [parentViewController.navigationController pushViewController:controller animated:YES];
}


@end
