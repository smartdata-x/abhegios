//
//  MusicAPI.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/3.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqeustDelegate.h"
@protocol MusicAPI <NSObject>
- (void)getMusicDimension:(id<ReqeustDelegate>) delegate Dimension:(NSString *)dimension Sid:(NSInteger)sid;
- (void)collectSong:(NSInteger)sid delegate:(id<ReqeustDelegate>)delegate;
- (void)deleteCltSong:(NSInteger)sid delegate:(id<ReqeustDelegate>)delegate;
- (void)hateSong:(NSInteger)sid delegate:(id<ReqeustDelegate>)delegate;
- (void)getMusicClt:(NSInteger)tid delegate:(id<ReqeustDelegate>)delegate;
@end
