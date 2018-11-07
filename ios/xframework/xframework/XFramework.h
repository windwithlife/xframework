//
//  XFramework.h
//  reactnative_multibundler
//
//  Created by ctrip on 2018/10/31.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface XFramework : NSObject
  + (instancetype) shareInstance ;
  - (void)initFramework:(NSDictionary *)launchOptions;
  + (void)openUrl:(NSString*)urlPath parentViewController:(UIViewController*) controller title:(NSString*) title;
  + (void)openPage:(NSString*)moduleName page:(NSString*)pageName ofType:(NSString*)pageType parentController:(UIViewController*) controller ;
@end
