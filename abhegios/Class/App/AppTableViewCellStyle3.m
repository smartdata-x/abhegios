//
//  AppTableViewCellStyle3.m
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle3.h"
#import "AppInfo.h"
#import "AppInfoGroup.h"
#import "AppInfoViewStyle3.h"

#define kMaxViewItems 8
#define kVitemWidth  78
#define kViewCellHeigth 90
@implementation AppTableViewCellStyle3
{
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    for (int i = 0; i < kMaxViewItems; ++i) {
        [self addViewItem];
    }
}

-(void) addViewItem
{
    CGFloat x = [[self subviews] count] * kVitemWidth;
    AppInfoViewStyle3* viewItem = [AppInfoViewStyle3 loadFromNib];
    CGRect rect = [viewItem frame];
    rect.origin.x = x;
    [viewItem setFrame:rect];
    [viewItem setTag:[[self subviews] count]];
    [self addSubview:viewItem];
    
}

//使用了scrollView的subviews存储 viewitem ，如遇添加其它view到scrollView请做处理
-(void) setData:(id)data
{
    [super setData:data];
    AppInfoGroup* appInfoGroup = data;
    NSUInteger count = [[appInfoGroup appInfos] count];
     count = count > kMaxViewItems ? kMaxViewItems: count;
    [self setContentWidth:kVitemWidth*count];
    NSUInteger i = 0;
    for (; i < count; ++i)
    {
        [[[self subviews] objectAtIndex:i] setData:[[appInfoGroup appInfos] objectAtIndex:i]];
    }
    for (; i < kMaxViewItems; ++i) {
        [[[self subviews] objectAtIndex:i] setHidden:YES];
    }
}

@end
