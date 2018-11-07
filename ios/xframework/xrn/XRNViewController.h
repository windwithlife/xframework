//
//  XRNViewController.h
//  reactnative_multibundler
//
//  Created by ctrip on 2018/11/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTBridge+Private.h>
#import "RCTBridge.h"

@interface XRNViewController : UIViewController
  - (XRNViewController*)attachRNBridge:(RCTBridge *)bridge moduleName:(NSString*)moduleName bundleName:(NSString*)bundleName;
@end
