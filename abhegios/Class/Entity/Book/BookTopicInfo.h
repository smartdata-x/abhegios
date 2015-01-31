//
//  BookTopicInfo.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfo.h"
@interface BookTopicInfo : OEZBaseEntity
@property (nonatomic, assign) NSInteger follow;
@property (nonatomic, retain) NSArray *topices;
@end
