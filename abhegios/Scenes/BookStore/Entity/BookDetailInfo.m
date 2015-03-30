//
//  BookDetailInfo.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfo.h"

@implementation BookDetailInfo

@end

@implementation BookDetailPage
- (instancetype) initWithDictionary:(NSDictionary *)dict {
    self = [self init];
    if (self != nil) {
        _summary = [[BookDetailInfo alloc] initWithDictionary:[dict objectForKey:@"summary"]];
        _label = [dict objectForKey:@"label"];
    }
    return self;
}
@end
