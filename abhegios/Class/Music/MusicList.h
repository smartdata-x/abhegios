//
//  MusicList.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicRoomInfo.h"

@interface MusicList : NSObject
@property (nonatomic, retain) NSMutableArray *musicListArray;
- (void)setMusicList:(NSArray *)musiclist;
- (BOOL)isListHaveNext;
- (void)cleanList;
- (MusicRoomInfo *)getNextMusicInfo;
- (MusicRoomInfo *)getPrevMusicInfo;
- (MusicRoomInfo *)getCurrentMusicInfo;
@end
