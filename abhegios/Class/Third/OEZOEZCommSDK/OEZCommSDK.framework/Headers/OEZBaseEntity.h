//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import <Foundation/Foundation.h>

//yaobanglin 本引擎只限内部使用
@interface OEZBaseEntity : NSObject
-(instancetype) initWithDictionary:(NSDictionary *) dict;

+(instancetype) initWithDictionary:(NSDictionary *) dict;
+(NSArray*) initWithsDictionarys:(NSArray*) dicts;
+(NSArray*) initWithsContentsOfPlistFile:(NSString *)path;
+(NSArray*) initWithsPlistResource:(NSString *)name ofType:(NSString *)ext;
+(NSArray*) initWithsJsonResource:(NSString *)name ofType:(NSString *)ext;
+(instancetype) initWithJsonResource:(NSString *)name ofType:(NSString *)ext;
@end