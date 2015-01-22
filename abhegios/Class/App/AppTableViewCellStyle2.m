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
    OEZPageView* _pageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _pageView = [[OEZPageView alloc] initWithFrame:self.frame];
    for (int i = 0; i < kMaxViewItems; ++i) {
        [self addViewItem];
    }
    [self.contentView setHidden:YES];
    [self addSubview:_pageView];
}

-(void) addViewItem
{
    UIImageView* viewItem = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    [viewItem setTag:[[self subviews] count]];
    [viewItem setImage:[UIImage imageNamed:@"s_banner"]];
    [_pageView addPageView:viewItem];
}

-(void) setData:(id)data
{
    [super setData:data];
    AppInfoGroup* appInfoGroup = data;
    NSUInteger count = [[appInfoGroup appInfos] count];
    count = count > kMaxViewItems ? kMaxViewItems: count;
}

@end
