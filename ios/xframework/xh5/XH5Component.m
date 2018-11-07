//
//  XH5Component.m
//  reactnative_multibundler
//
//  Created by ctrip on 2018/10/31.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "XH5Component.h"
#import "JKWKWebViewController.h"

@implementation XH5Component

+ (instancetype)sharedInstance
{
  static XH5Component *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[XH5Component alloc] init];
    [instance initH5Env];
  });
  
  return instance;
}
- (void)initH5Env {
  
}
- (UIViewController*)createH5ViewController:(NSString*)urlPath bundleName:(bool)isLocal {
  JKWKWebViewController *jkVC = [JKWKWebViewController new];
  NSString *url = [NSString stringWithFormat:@"file://%@",[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"]];
  jkVC.url = url;
  return jkVC;
}
+ (void)openH5Page:(UIViewController*)parentViewController url:(NSString*)urlPath isHybrid:(bool)isLocal{
  UIViewController* controller = [[XH5Component sharedInstance] createH5ViewController:urlPath bundleName:isLocal];
  [parentViewController.navigationController pushViewController:controller animated:YES];
  
}
@end
