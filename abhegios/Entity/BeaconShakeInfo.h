//
//  BeaconShakeInfo.h
//  abhegios
//
//  Created by yaobanglin on 15/4/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseInfo.h"
@interface BeaconShakeInfo : BaseInfo
@property                    NSInteger bid;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *pic;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *intor;
@end
