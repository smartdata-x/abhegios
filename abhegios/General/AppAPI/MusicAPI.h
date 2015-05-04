//
//  MusicAPI.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/3.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqeustDelegate.h"
#define REQUEST_COLLECTSONG     @"0x1C"
#define REQUEST_DELETESONG      @"0x2D"
@protocol MusicAPI <NSObject>
- (void)getMusicDimension:(id<ReqeustDelegate>) delegate Dimension:(NSString *)dimension Sid:(NSInteger)sid;
- (void)collectSong:(NSInteger)sid tid:(NSInteger)tid dimension:(NSString *)dimension delegate:(id<ReqeustDelegate>)delegate;
- (void)deleteCltSong:(NSInteger)sid delegate:(id<ReqeustDelegate>)delegate;
- (void)hateSong:(NSInteger)sid delegate:(id<ReqeustDelegate>)delegate;
- (void)getMusicClt:(NSInteger)tid delegate:(id<ReqeustDelegate>)delegate;
@end
