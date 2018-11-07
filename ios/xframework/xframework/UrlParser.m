//
//  UrlParser.m
//  reactnative_multibundler
//
//  Created by ctrip on 2018/11/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "UrlParser.h"
@interface UrlParser()

@end

@implementation UrlParser
- (UrlParser*) initWithUrlPath:(NSString*)urlPath {
    NSRange rangeSchema = [urlPath rangeOfString:@"://"];
    NSString* pathString;
    NSString* queryString;
    NSArray *strArray;
    if (rangeSchema.location != NSNotFound && rangeSchema.length > 0) {
        pathString = [urlPath substringFromIndex:rangeSchema.location + 3];
        self.schema = [urlPath substringToIndex:rangeSchema.location];
        NSRange rangeQuery = [urlPath rangeOfString:@"?"];
        if (rangeQuery.location != NSNotFound){
            self.path   = [pathString substringToIndex:rangeQuery.location];
            queryString = [pathString substringFromIndex:rangeQuery.location];
            self.queryArry = [queryString componentsSeparatedByString:@"&"];
        }else{
            self.path = pathString;
        }
    }
    strArray = [self.path componentsSeparatedByString:@"/"];
    self.moduleName  = strArray.firstObject;
    self.channelName = [strArray objectAtIndex:1];
    self.pageName    = strArray.lastObject;
  
  
    return self;
}
@end
