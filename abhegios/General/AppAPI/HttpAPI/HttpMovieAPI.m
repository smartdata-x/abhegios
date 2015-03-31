//
//  HttpMovieAPI.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HttpMovieAPI.h"
#import "GroupInfo.h"
#import "MovieInfo.h"
#import "MovieDetailInfo.h"

@implementation HttpMovieAPI
- (void)getMovieStore:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/find/1/moviestore.fcgi";
    [self request:path delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"moviecenter" groupsData:data entityClass:[MovieInfo class]];
    }];
}

- (void)getMovieDetails:(NSInteger)movieID delegate:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/movie/1/summary.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(movieID) forKey:@"id"] delegate:delegate entityClass:[MovieDetailInfo class]];
}

- (void)getMovieSearchResult:(NSInteger)typeID delegate:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/movie/1/searchtype.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(typeID) forKey:@"tid"] delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"moviecenter" groupsData:data entityClass:[MovieInfo class]];
    }];
}
@end
