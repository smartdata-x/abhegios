//
//  MovieAPI.h
//  abhegios
//
//  Created by Archer_LJ on 15/3/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqeustDelegate.h"
@protocol MovieAPI <NSObject>
- (void)getMovieStore:(id<ReqeustDelegate>) delegate;
- (void)getMovieDetails:(NSInteger)movieID delegate:(id<ReqeustDelegate>)delegate;
- (void)getMovieSearchResult:(NSInteger)typeID delegate:(id<ReqeustDelegate>)delegate;
- (void)doLike:(NSInteger)movieID delegate:(id<ReqeustDelegate>)delegate;
-(void) getPersonal:(id<ReqeustDelegate>) delegate;
@end