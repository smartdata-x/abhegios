//
//  MovieDetailInfo.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieDetailInfo.h"
#import "ADInfo.h"

@implementation MovieDetail

@end

@implementation MovieDetailInfo
- (instancetype) initWithDictionary:(NSDictionary *)dict {
    self = [self init];
    if (self != nil) {
        _summary = [[MovieDetail alloc] initWithDictionary:[dict objectForKey:@"summary"]];
        _about = [MovieInfo initWithsDictionarys:[dict objectForKey:@"about"]];
        _advert = [MovieInfo initWithsDictionarys:[dict objectForKey:@"advert"]];
    }
    return self;
}
@end
