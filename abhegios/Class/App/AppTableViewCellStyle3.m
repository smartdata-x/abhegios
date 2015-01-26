//
//  AppTableViewCellStyle3.m
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle3.h"
#import "AppInfo.h"
#import "AppHScrollViewCell1.h"

#define kMaxViewItems 8
#define kVitemWidth  78
#define kViewCellHeigth 90
@implementation AppTableViewCellStyle3
{
    
}



-(NSInteger) numberColumnCountHScrollView:(OEZHScrollView *)hScrollView
{
    return [self.data count];
}

-(CGFloat) hScrollView:(OEZHScrollView *)hScrollView widthForColumnAtIndex:(NSInteger)columnIndex
{
    return 78;
}

-(OEZHScrollViewCell*) hScrollView:(OEZHScrollView *)hScrollView cellForColumnAtIndex:(NSInteger)columnIndex
{
    AppHScrollViewCell1 *cell = [hScrollView dequeueReusableCellWithIdentifier:@"AppHScrollViewCell1"];
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
