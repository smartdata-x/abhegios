//
//  umengTrackHelper.h
//  abhegios
//
//  Created by Archer_LJ on 15/4/7.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperProtocol.h"

@interface umengTrackHelper : NSObject<HelperProtocol>
- (void)startTrack;

@property (nonatomic,retain) NSString* path;
@end
