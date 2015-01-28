//
//  GameHomeTableViewCell2.m
//  abhegios
//
//  Created by 180 on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "GameHomeTableViewCellStyle2.h"
#import "GameHScrollViewCell.h"
@implementation GameHomeTableViewCellStyle2

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
    GameHScrollViewCell *cell = [hScrollView dequeueReusableCellWithIdentifier:identifier];
    [cell setData:[self.data objectAtIndex:columnIndex]];
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
