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
@implementation AppTableViewCellStyle2
{
    OEZPageView*    _pageView;
    NSMutableArray *_pages;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _pages = [[NSMutableArray alloc] init];
    _pageView = [[OEZPageView alloc] initWithFrame:self.frame];
    for (int i = 0; i < kMaxViewItems; ++i) {
        [self addViewItem];
    }
    [self addSubview:_pageView];
    
    [self.contentView setHidden:YES];
}


-(void) addViewItem
{
    UIView *view = [[UIView alloc] initWithFrame:self.frame];
    for (UIView *view1 in self.contentView.subviews) {
        UIView *view2 = [[[view1 class] alloc] initWithFrame:view1.frame];
        if ( [view2 isKindOfClass:[UIImageView class]] )
        {
            [(UIImageView*)view2 setImage:[(UIImageView*)view1 image]];
        }
        [view addSubview:view2];
    }
    UILabel *index = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
    [_pages addObject:view];
    [view addSubview:index];
    [view setTag:[[_pageView pageViews] count]];
    [index setText:[NSString stringWithFormat:@"%d",[_pages count]]];
}

-(void) setData:(id)data
{
    [super setData:data];
    AppInfoGroup* appInfoGroup = data;
    NSUInteger count = [[appInfoGroup appInfos] count];
    count = count > kMaxViewItems ? kMaxViewItems: count;
    NSInteger i = 0;
    for (; i < count; ++i) {
        [_pageView addPageView:[_pages objectAtIndex:i]];
    }
    for (; i < [_pages count]; ++i) {
        [[_pages objectAtIndex:i] removeFromSuperview];
    }
}

@end
