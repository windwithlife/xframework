//
//  ModuleDispatcher.m
//  xframework for ios
//
//  Created by zhangyq on 2018/11/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//
#import <libkern/OSAtomic.h>
#import "ModuleDispatcher.h"

@interface ModuleDispatcher()
@property (nonatomic, strong) NSMutableDictionary *modulesObjectMap;
@end

static ModuleDispatcher *g_moduleDispatcher;

@implementation ModuleDispatcher
+ (void)initializeBusIfNeed {
  if (g_moduleDispatcher == NULL) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      g_moduleDispatcher = [[ModuleDispatcher alloc] init];
    });
  }
}

+ (ModuleDispatcher *)sharedInstance {
  [ModuleDispatcher initializeBusIfNeed];
  return g_moduleDispatcher;
}
- (id)init {
  if (self = [super init]) {
    self.modulesObjectMap = [NSMutableDictionary dictionary];
  }
  
  return self;
}

+ (void)register:(XModule *)module{
    OSSpinLock spinLock = OS_SPINLOCK_INIT;
    OSSpinLockLock(&spinLock);
    if ([[ModuleDispatcher sharedInstance].modulesObjectMap valueForKey:module.businessName]){
      NSAssert(false, @"模块名=[%@]已注册，不可重复注册", module.businessName);
    }
    [[ModuleDispatcher sharedInstance].modulesObjectMap setValue:module forKey:module.businessName];
    OSSpinLockUnlock(&spinLock);
}
+ (XModule *)getModuleObjectByName:(NSString *)bizName {
    OSSpinLock spinLock = OS_SPINLOCK_INIT;
    OSSpinLockLock(&spinLock);
  
    NSDictionary *objectsMap = [ModuleDispatcher sharedInstance].modulesObjectMap;
  
    NSArray *hostList = [objectsMap allKeys];
    NSString *findKey = nil;
    for (NSString *aKey in hostList) {
      if ([[bizName lowercaseString] hasPrefix:[aKey lowercaseString]]) {
        findKey = aKey;
        break;
      }
    }
    XModule *bizObj = [objectsMap valueForKey:findKey];
    OSSpinLockUnlock(&spinLock);
  
    if (![bizObj isKindOfClass:[XModule class]]) {
      NSAssert(false, @"找不到bizName:[%@]对应的ModuleObject",bizName);
      return NULL;
    }
  
    return bizObj;
}
+ (id)dispatch:(NSString *)buinessName param:(NSObject *)param, ... NS_REQUIRES_NIL_TERMINATION {
  
  XModule *bizObj = [ModuleDispatcher getModuleObjectByName:buinessName];
  
  NSMutableArray *paramArr = nil;
  id eachItem;
  va_list argumentList;
  if (param != nil) {
    paramArr = [NSMutableArray array];
    
    [paramArr addObject: param];
    va_start(argumentList, param);
    while((eachItem = va_arg(argumentList, id))) {
      [paramArr addObject: eachItem];
    }
    va_end(argumentList);
  }
  
  id ret = [bizObj doDataJob:buinessName params:paramArr];
  return ret;
    
}
+ (void)dispatchAsync:(NSString *)bizName result:(AsyncCallbackResult)resultCallback param:(NSObject *)param,... NS_REQUIRES_NIL_TERMINATION{
  XModule *bizObj = [ModuleDispatcher getModuleObjectByName:bizName];
  
  NSMutableArray *paramArr = nil;
  id eachItem;
  va_list argumentList;
  if (param != nil) {
    paramArr = [NSMutableArray array];
    
    [paramArr addObject: param];
    va_start(argumentList, param);
    while((eachItem = va_arg(argumentList, id))) {
      [paramArr addObject: eachItem];
    }
    va_end(argumentList);
  }
  
  [bizObj doAsyncDataJob:bizName params:paramArr callbackBlock:resultCallback];
  
  //return ret;
}
+ (id)dispatchURLRequest:(NSURL *)url {
    NSString *host = [url host];
    XModule *bizObj = [ModuleDispatcher getModuleObjectByName:host];
    return [bizObj doURLJob:url];
}
+ (void)dispatchURLRequestAsync:(NSURL *)url result:(AsyncCallbackResult)resultCallback{
    NSString *host = [url host];
    XModule *bizObj = [ModuleDispatcher getModuleObjectByName:host];
    [bizObj doAsyncURLJob:url callbackBlock:resultCallback];
}
@end
