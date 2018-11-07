//
//  UrlParser.h
//  reactnative_multibundler
//
//  Created by ctrip on 2018/11/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlParser : NSObject
- (UrlParser*) initWithUrlPath:(NSString*)urlPath;
@property(nonatomic,strong) NSString* schema;
@property(nonatomic,strong) NSString* path;
@property(nonatomic,strong) NSArray*  queryArry;
@property(nonatomic,strong) NSString* moduleName;
@property(nonatomic,strong) NSString* channelName;
@property(nonatomic,strong) NSString* pageName;
@end
