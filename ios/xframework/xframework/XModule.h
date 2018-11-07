//
//  XModule.h
//  reactnative_multibundler
//
//  Created by zhangyq on 2018/11/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^AsyncCallbackResult)(id response, NSError *error);

@interface XModule : NSObject

@property (nonatomic, readonly) NSString * businessName;

/**
 *  模块入口类，需要子类重载
 *
 *  @param
 *  @param
 *
 *  @return
 */
- (id)initWithName:(NSString *)businessName;

- (id)doDataJob:(NSString *)businessName
         params:(NSArray *)params;

- (void)doAsyncDataJob:(NSString *)businessName
                params:(NSArray *)params
           callbackBlock:(AsyncCallbackResult)result;

- (id)doURLJob:(NSURL *)url;

- (void)doAsyncURLJob:(NSURL *)url callbackBlock:(AsyncCallbackResult)result;


@end
