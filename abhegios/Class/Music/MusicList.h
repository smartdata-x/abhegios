//
//  MusicList.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicList : NSObject
- (BOOL)isListEmpty;
- (void)getNextMusicInfo;
- (void)getPrevMusicInfo;
@end
