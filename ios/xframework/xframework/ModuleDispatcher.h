//
//  ModuleDispatcher.h
//  reactnative_multibundler
//
//  Created by ctrip on 2018/11/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XModule.h"
@interface ModuleDispatcher : NSObject
/**
 *  各业务线注册业务模块到模块管理器，方便接收总线发起的调用
 *
 *  @param 
 */
+ (ModuleDispatcher *)sharedInstance;
+ (void)register:(XModule *)module;
+ (id)dispatch:(NSString *)buinessName param:(NSObject *)param, ... NS_REQUIRES_NIL_TERMINATION;
+ (void)dispatchAsync:(NSString *)bizName result:(AsyncCallbackResult)resultCallback param:(NSObject *)param,... NS_REQUIRES_NIL_TERMINATION;
+ (id)dispatchURLRequest:(NSURL *)url;
+ (void)dispatchURLRequestAsync:(NSURL *)url result:(AsyncCallbackResult)resultCallback;
@end
