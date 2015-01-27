//
//  ApplyAPI.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppAPIDelegate.h"
@protocol ApplyAPI <NSObject>
-(void) getAppStoreHome:(id<AppNetAndCacheAPIDelegate>) delegate;
-(void) getGameStoreHome:(id<AppNetAndCacheAPIDelegate>) delegate;
-(void) getAppDetails:(NSInteger) id delegate:(id<AppNetAPIDelegate>) delegate;
@end
