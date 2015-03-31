//
//  MovieDetailInfo.h
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieInfo.h"

@interface MovieDetail : MovieInfo
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *url;
@end

@interface MovieDetailInfo : OEZBaseEntity
@property (nonatomic, retain) MovieDetail *summary;
@property (nonatomic, retain) NSArray *about;
@property (nonatomic, retain) NSArray *advert;
@end
