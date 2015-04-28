//
//  ApplyAPI.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqeustDelegate.h"
@protocol ApplyAPI <NSObject>
-(void) getAppStoreHome:(id<ReqeustDelegate>) delegate;
-(void) getGameStoreHome:(id<ReqeustDelegate>) delegate;
-(void) getAppDetails:(NSInteger) appID delegate:(id<ReqeustDelegate>) delegate;
-(void) getWanted:(NSInteger) appID delegate:(id<ReqeustDelegate>) delegate;
-(void) getSpecialTopics:(NSInteger) tID delegate:(id<ReqeustDelegate>) delegate;
-(void) getAppPersonal:(id<ReqeustDelegate>) delegate;
-(void) getGamePersonal:(id<ReqeustDelegate>) delegate;
@end
