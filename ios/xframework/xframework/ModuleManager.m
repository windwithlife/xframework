//
//  ModuleManager.m
//  reactnative_multibundler
//
//  Created by ctrip on 2018/11/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "XModule.h"
#import "ModuleDispatcher.h"
#import "ModuleManager.h"

@implementation ModuleManager
+ (void)registerAllBizModules {
  NSDictionary *busMap = @{    @"TestPage":@"test",
                               @"testController":@"testcontroller"
                               };
  
  [busMap enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    XModule *bizObject = [[NSClassFromString((NSString *)key) alloc] initWithName:(NSString *)obj];
    [ModuleDispatcher register:bizObject];
  }];
}

@end
