//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperProtocol.h"
#import "ILogin.h"


@interface UserHelper : NSObject<HelperProtocol>
-(void) login:(LoginType) source delegate:(id<LoginDelegate>) delegate;
@end