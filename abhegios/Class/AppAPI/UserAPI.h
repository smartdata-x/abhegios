//
//  UserAPI.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//
#import "AppAPIDelegate.h"
@class ThirdLoginInfo;
@protocol UserAPI <NSObject>
-(void) thirdLogin:(ThirdLoginInfo*) loginInfo delegate:(id<AppNetAPIDelegate>) delegate;
@end

