//
//  HttpAPI.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqeustDelegate.h"
#import "RequestInfo.h"
#import "HTTPReqeust.h"
@interface HttpAPI : HTTPReqeust
-(id) initWithRequest:(RequestInfo*) RequestInfo;

-(void) request:(NSString*) path delegate:(id<ReqeustDelegate>) delegate entityClass:(Class) entityClass;

-(void) request:(NSString*) path parameter:(NSDictionary*) parameter delegate:(id<ReqeustDelegate>) delegate entityClass:(Class) entityClass;

-(void) request:(NSString*) path delegate:(id<ReqeustDelegate>)delegate processBlock:(ProcessBlock) processBlock;

-(void) request:(NSString*) path parameter:(NSDictionary*) parameter delegate:(id<ReqeustDelegate>)delegate processBlock:(ProcessBlock) processBlock;
@end