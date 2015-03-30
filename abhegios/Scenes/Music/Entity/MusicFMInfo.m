//
//  MusicFMInfo.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/9.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicFMInfo.h"
#import "GroupInfo.h"
#import "MusicPlayerHelper.h"

@implementation MusicFMInfo
+ (NSArray *)getLocationFromGroupinfo:(NSArray *)groupinfo Dimension:(NSString *)dimension Sid:(NSInteger)sid {
    NSInteger musicDimension = 0;
    NSInteger musicSid = 0;
    for (int i=0; i<[groupinfo count]; i++) {
        if ([[[groupinfo objectAtIndex:i] key] isEqualToString:[PlayerInstance dimension]]) {
            musicDimension = i;
            break;
        }
    }
    for (int i=0; i<[[[groupinfo objectAtIndex:musicDimension] entitys] count]; i++) {
        if ([[[[groupinfo objectAtIndex:musicDimension] entitys] objectAtIndex:i] sid] == [PlayerInstance sid]) {
            musicSid = i;
        }
    }
    
    NSArray *ret = [[NSArray alloc] initWithObjects:@(musicDimension), @(musicSid), nil];
    return ret;
}
@end
