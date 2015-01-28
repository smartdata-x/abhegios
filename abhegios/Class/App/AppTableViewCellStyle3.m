//
//  AppTableViewCellStyle3.m
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle3.h"
#import "AppHScrollViewCell1.h"
#import "MyIndexPath.h"
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


-(void) setData:(id)data
{
    if( data != self.data)
    {
        [super setData:data];
        [self.hScrollView reloadData];
    }
}

-(void) hScrollView:(OEZHScrollView *)hScrollView didSelectColumnAtIndex:(NSInteger)columnIndex
{
    
    UITableView *superTableview = (UITableView *)self.superview;
    if (![superTableview isKindOfClass:[UITableView class]])
    {
        superTableview = (UITableView *)superTableview.superview;
    }
    
    if (superTableview)
    {
        
        id<UITableViewDelegate> superviewDelegate = superTableview.delegate;
        NSIndexPath * selfIndexPath = [superTableview indexPathForCell:self];
         [superviewDelegate tableView:superTableview didSelectRowAtIndexPath:[MyIndexPath indexPathForRow:columnIndex insection1:selfIndexPath.row inSection:selfIndexPath.section]];
    }

}
@end
