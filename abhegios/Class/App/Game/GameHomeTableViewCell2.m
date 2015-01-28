//
//  GameHomeTableViewCell2.m
//  abhegios
//
//  Created by 180 on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "GameHomeTableViewCell2.h"

@implementation GameHomeTableViewCell2

-(NSInteger) numberColumnCountHScrollView:(OEZHScrollView *)hScrollView
{
    return [self.data count];
}

-(CGFloat) hScrollView:(OEZHScrollView *)hScrollView widthForColumnAtIndex:(NSInteger)columnIndex
{
    return kMainScreenWidth/3;
}

-(OEZHScrollViewCell*) hScrollView:(OEZHScrollView *)hScrollView cellForColumnAtIndex:(NSInteger)columnIndex
{
    static NSString *identifier = @"GameHScrollViewCell";
    OEZHScrollViewCell *cell = [hScrollView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}


-(void) setData:(id)data
{
    if( data != self.data)
    {
        [super setData:data];
        [self.hScrollView reloadData];
    }
}


@end
