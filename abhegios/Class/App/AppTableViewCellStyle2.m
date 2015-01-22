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
    NSMutableArray *_pages;
    UIEdgeInsets    _imgInsets;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _pages = [[NSMutableArray alloc] init];
    _pageView = [[OEZPageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kTableViewCellHieght)];
    [self.contentView setHidden:YES];
    [_pageView setDelegate:self];
     [self addSubview:_pageView];
    
    for (int i  = 0 ; i < kMaxViewItems; ++i) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenHeight, 80)];
        [imageView setImage:[UIImage imageNamed:@"s_banner"]];
        [_pages addObject:imageView];
    }

}


-(void) setData:(id)data
{
    if( self.data != data)
    {
        [super setData:data];
        AppInfoGroup* appInfoGroup = data;
        NSUInteger count = [[appInfoGroup appInfos] count];
        count = count > kMaxViewItems ? kMaxViewItems: count;
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

-(UIView*) pageView:(OEZPageView *)pageView viewForPageAtIndex:(NSInteger)pageIndex
{
    NSLog(@"viewForPageAtIndex %@",@(pageIndex));
    return [_pages objectAtIndex:pageIndex];
}
@end
