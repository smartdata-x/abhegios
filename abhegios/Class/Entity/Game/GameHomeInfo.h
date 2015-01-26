//
//  GameHomeInfo.h
//  abhegios
//
//  Created by 180 on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>
#import "AppDetailsInfo.h"
@interface GameHomeInfo : OEZBaseEntity
@property(nonatomic, retain)      AppDetailsInfo      *find;
@property(nonatomic, retain)      NSArray             *groups;
@end
