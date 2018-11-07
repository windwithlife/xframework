//
//  XH5Component.h
//  reactnative_multibundler
//
//  Created by ctrip on 2018/10/31.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XH5Component : NSObject
+ (instancetype)sharedInstance;
+ (void)openH5Page:(UIViewController*)parentViewController url:(NSString*)urlPath isHybrid:(bool)isLocal;
@end
