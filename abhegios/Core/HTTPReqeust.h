//
//  HTTPReqeust.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqeustDelegate.h"

typedef void (^CompleteBlock)(id data);
typedef void (^ErrorBlock)(NSError* error);
typedef id (^ProcessBlock)(id data);
@interface HTTPReqeust : NSObject

-(void) request:(NSString*) url delegate:(id<ReqeustDelegate>) delegate processBlock:(ProcessBlock) processBlock;
-(void) request:(NSString*) url parameter:(NSDictionary*) parameter delegate:(id<ReqeustDelegate>) delegate processBlock:(ProcessBlock) processBlock;

-(void) requestJson:(NSString*) url delegate:(id<ReqeustDelegate>) delegate processBlock:(ProcessBlock) processBlock;
-(void) requestJson:(NSString*) url parameter:(NSDictionary*) parameter delegate:(id<ReqeustDelegate>) delegate processBlock:(ProcessBlock) processBlock;
@end
