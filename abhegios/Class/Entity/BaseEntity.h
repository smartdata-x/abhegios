//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BaseEntity : NSObject
-(id) init:(NSDictionary*) json;
+(NSArray*) initWithsDictionarys:(NSArray*) dics;
+(NSArray*) initWithsContentsOfPlistFile:(NSString *)path;
+(NSArray*) initWithsPlistResource:(NSString *)name ofType:(NSString *)ext;
+(NSArray*) initWithsJsonResource:(NSString *)name ofType:(NSString *)ext;
@end