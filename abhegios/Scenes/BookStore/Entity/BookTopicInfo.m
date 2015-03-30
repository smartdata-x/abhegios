//
//  BookTopicInfo.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookTopicInfo.h"

@implementation BookTopicInfo
- (instancetype) initWithDictionary:(NSDictionary *)dict {
    self = [self init];
    if (self != nil) {
        _follow = [[dict objectForKey:@"follow"] integerValue];
        _topices = [BookInfo initWithsDictionarys:[dict objectForKey:@"topices"]];
    }
    return self;
}
@end
