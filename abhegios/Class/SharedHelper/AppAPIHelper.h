//
//  AppAPIHelper.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperProtocol.h"
#import "UserAPI.h"
#import "ApplyAPI.h"
@interface AppAPIHelper : NSObject<HelperProtocol>
-(id<UserAPI>) getUserAPI;
-(id<ApplyAPI>) getApplyAPI;
@end
