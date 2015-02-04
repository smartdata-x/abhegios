//
//  FoundTableViewCell1.m
//  abhegios
//
//  Created by 180 on 15/2/4.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "FoundTableViewCell1.h"

@implementation FoundTableViewCell1



-(NSInteger) numberColumnCountHScrollView:(OEZHScrollView *)hScrollView
{
    return 2;
}

-(CGFloat) hScrollView:(OEZHScrollView *)hScrollView widthForColumnAtIndex:(NSInteger)columnIndex
{
    return kMainScreenWidth/2;
}

-(OEZHScrollViewCell*) hScrollView:(OEZHScrollView *)hScrollView cellForColumnAtIndex:(NSInteger)columnIndex
{
    static NSString *identifier = @"FoundHScrollViewCell";
    OEZHScrollViewCell *cell = [hScrollView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

-(void) setData:(id)data
{
    [self.hScrollView reloadData];
}
@end
