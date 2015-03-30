//
//  MovieDetailInfo.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieDetailInfo.h"

@implementation MovieDetail

@end

@implementation MovieDetailInfo
- (instancetype) initWithDictionary:(NSDictionary *)dict {
    self = [self init];
    if (self != nil) {
        _summary = [[MovieDetail alloc] initWithDictionary:[dict objectForKey:@"summary"]];
    }
    return self;
}
@end
