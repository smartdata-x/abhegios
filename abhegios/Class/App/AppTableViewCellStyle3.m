//
//  AppTableViewCellStyle3.m
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle3.h"
#import "AppHScrollViewCell1.h"
#define kViewitemWidth  78
@implementation AppTableViewCellStyle3
{
    
}



-(NSInteger) numberColumnCountHScrollView:(OEZHScrollView *)hScrollView
{
    return [self.data count];
}

-(CGFloat) hScrollView:(OEZHScrollView *)hScrollView widthForColumnAtIndex:(NSInteger)columnIndex
{
    return kMainScreenWidth/4;
}

-(OEZHScrollViewCell*) hScrollView:(OEZHScrollView *)hScrollView cellForColumnAtIndex:(NSInteger)columnIndex
{
    static NSString *identifier = @"AppHScrollViewCell1";
    AppHScrollViewCell1 *cell = [hScrollView dequeueReusableCellWithIdentifier:identifier];
    if( cell == nil)
    {
        cell = [[AppHScrollViewCell1 alloc]  initWithReuseIdentifier:identifier];
    }
    [cell setData:[self.data objectAtIndex:columnIndex]];
    return cell;
}


-(void) hScrollView:(OEZHScrollView *)hScrollView didSelectColumnAtIndex:(NSInteger)columnIndex
{
    [self didSelectRowColumn:columnIndex];
}
@end
