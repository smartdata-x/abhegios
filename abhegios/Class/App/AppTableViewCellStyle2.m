//
//  AppTableViewCellStyle2.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle2.h"
#import "AppInfo.h"
#import "AppInfoGroup.h"
#define kMaxViewItems 4
#define kTableViewCellHieght 80
@implementation AppTableViewCellStyle2
{
    OEZPageView*    _pageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _pageView = [[OEZPageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kTableViewCellHieght)];
    [self.contentView setHidden:YES];
    [_pageView setDelegate:self];
    [self addSubview:_pageView];
}


-(void) setData:(id)data
{
    if( self.data != data)
    {
        [super setData:data];
        [_pageView reloadData];
    }
}

-(NSInteger) numberPageCountPageView:(OEZPageView *)pageView
{
    return [[self.data appInfos] count];
}

-(void) pageView:(OEZPageView *)pageView didSelectPageAtIndex:(NSInteger)pageIndex
{
    NSLog(@"didSelectRPageAtIndex %@",@(pageIndex));
}

-(OEZPageViewCell*) pageView:(OEZPageView *)pageView viewForPageAtIndex:(NSInteger)pageIndex
{
    OEZPageViewCell *cell = [pageView dequeueReusablePageViewWithIdentifier:nil];
    //NSLog(@"pageIndex:%@ %@",@(pageIndex),[[cell subviews] objectAtIndex:0]);
    if( cell == nil)
    {
        cell = [[OEZPageViewCell alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kTableViewCellHieght)];
    
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.frame];
        [cell addSubview:imageView];
        
        [imageView setImage:[UIImage imageNamed:@"s_banner"]];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        
        [cell addSubview:lable];
        
    }
    [[[cell subviews] objectAtIndex:1] setText:[NSString stringWithFormat:@"%@",@(pageIndex)]];
    return cell;
}
@end
