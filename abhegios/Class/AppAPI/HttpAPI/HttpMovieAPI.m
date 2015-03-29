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

@implementation HttpMovieAPI
- (void)getMovieStore:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/find/1/moviestore.fcgi";
    [self request:path delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"moviecenter" groupsData:data entityClass:[MovieInfo class]];
    }];
}
@end
