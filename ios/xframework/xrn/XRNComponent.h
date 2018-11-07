//
//  XRNComponent.h
//  reactnative_multibundler
//
//  Created by ctrip on 2018/10/31.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XRNComponent : NSObject
+ (instancetype)sharedInstance;
//- (void)initRNEnv:(NSDictionary *)launchOptions;
+ (void)openRNPage:(UIViewController*) parentViewController moduleName:(NSString*)moduleName bundleName:(NSString*)bundleName;
@end
