//
//  XModule.m
//  reactnative_multibundler
//
//  Created by ctrip on 2018/11/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "XModule.h"

@implementation XModule

- (id)initWithName:(NSString *)businessName {
  return NULL;
}
- (id)doDataJob:(NSString *)businessName
         params:(NSArray *)params{
  return NULL;
}

- (void)doAsyncDataJob:(NSString *)businessName
                params:(NSArray *)params
         callbackBlock:(AsyncCallbackResult)result {
  return;
}

- (id)doURLJob:(NSURL *)url {
  return NULL;
}

- (void)doAsyncURLJob:(NSURL *)url callbackBlock:(AsyncCallbackResult)result {
  return;
}
@end
