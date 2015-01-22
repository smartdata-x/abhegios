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
@interface ViewItem : UIView
@property UIButton *logo;
@property UILabel *name;
@end

@implementation ViewItem
-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _logo = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logo setFrame:CGRectMake((CGRectGetWidth(frame)-54)/2, 10, 54, 54)];
        [_logo setImage:[UIImage imageNamed:@"app-icon-default"] forState:UIControlStateNormal];
        [[_logo layer] setCornerRadius:8.0f];
        [[_logo layer] setMasksToBounds:YES];
        [self addSubview:_logo];
        _name = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(frame)-54)/2-5, 64, 64, 20)];
        [_name setFont:[UIFont systemFontOfSize:14.0f]];
        [_name setTextColor:kUIColorWithRGB(0x9e9e9e)];
        [_name setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_name];
    }
    return self;
}
-(void) setData:(AppInfo*) appInfo
{
    [_name setText:[appInfo name]];
    [self setHidden:NO];
}
@end
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
    ViewItem* viewItem = [[ViewItem alloc] initWithFrame:CGRectMake(x, 0, kVitemWidth,kViewCellHeigth)];
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
