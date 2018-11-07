//
//  XFramework.m
//  reactnative_multibundler
//
//  Created by ctrip on 2018/10/31.
//  Copyright © 2018年 Facebook. All rights reserved.
//
#import "UrlParser.h"
#import "ModuleDispatcher.h"
#import "XH5Component.h"
#import "XRNComponent.h"
#import "XFramework.h"




@implementation XFramework
static XFramework* _instance = nil;
+(instancetype) shareInstance
{
  static dispatch_once_t onceToken ;
  dispatch_once(&onceToken, ^{
    _instance = [[super allocWithZone:NULL] init];
    //[_instance initFramework];
  }) ;
  return _instance ;
}

- (void)initFramework:(NSDictionary *)launchOptions {
  [XRNComponent sharedInstance];
  
}
+ (void)openUrl:(NSString*)urlPath parentViewController:(UIViewController*) controller title:(NSString*) title {
     UrlParser* url = [[UrlParser alloc] initWithUrlPath:urlPath];
  
    if ([urlPath.lowercaseString hasPrefix:@"xschema:"]) {
      [ModuleDispatcher dispatch:url.moduleName param:urlPath,controller,nil];
    }else if ([urlPath.lowercaseString hasPrefix:@"http"]){
        [XH5Component openH5Page:controller url:urlPath isHybrid:false];
    }else if ([urlPath.lowercaseString hasPrefix:@"file:"]){
        [XH5Component openH5Page:controller url:urlPath isHybrid:true];
    }else if ([urlPath.lowercaseString hasPrefix:@"rn:"]){
        [XRNComponent openRNPage:controller moduleName:url.moduleName bundleName:url.pageName];
    }
}

+ (void)openPage:(NSString*)moduleName page:(NSString*)pageName ofType:(NSString*)pageType parentController:(UIViewController*) controller {
    if ([pageType isEqualToString:@"rn"]) {
        [XRNComponent openRNPage:controller moduleName:moduleName bundleName:pageName];
    }
}

@end
