//
//  BookStoreTableViewCellStyle3.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreTableViewCellStyle3.h"
#import "BookInfo.h"
#import "BookInfoViewStyle1.h"
#import "BookInfoViewStyle4.h"
#import "GroupInfo.h"
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"

#define kMaxBookItemView 3
#define kBookItemWidth 108
#define kBookCellHeight 153

@interface BookStoreTableViewCellStyle3()
{
    NSInteger withoutSummary;
}
@end

@implementation BookStoreTableViewCellStyle3

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.scrollView setFrame:self.frame];
    withoutSummary = NO;
}

- (void)addViewItem {
    CGFloat gap = (mainScreenWidth - kMaxBookItemView * 108) / 2;
    gap = gap > 0.0f ? gap : 0.0f;
    NSUInteger existCount = [[self subviews] count];
    CGFloat x = existCount * kBookItemWidth;
    BookInfoViewStyle1 *viewItem = [BookInfoViewStyle1 loadFromNib];
    CGRect rect = [viewItem frame];
    rect.origin.x = x + gap * (existCount);
    [viewItem setFrame:rect];
    [viewItem setTag:[[self subviews] count]];
    [viewItem.logoButton setTag:[[self subviews] count]];
    [viewItem.logoButton addTarget:self action:@selector(itemClickedAtIndex:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:viewItem];
}

- (void)setData:(id)data {
    for (int i=0; i<kMaxBookItemView; i++) {
        [self addViewItem];
    }
    [super setData:data];
    GroupInfo *bookInfoGroup = data;
    NSUInteger count = [[bookInfoGroup entitys] count];
    count = count > kMaxBookItemView ? kMaxBookItemView : count;
    [self setContentWidth:kBookItemWidth * count];
    NSUInteger i = 0;
    for (; i < count; ++i)
    {
        [[[self subviews] objectAtIndex:i] setData:[[bookInfoGroup entitys] objectAtIndex:i]];
    }
    for (; i < kMaxBookItemView; ++i) {
        [[[self subviews] objectAtIndex:i] setHidden:YES];
    }
}

- (void)setDataWithOutSummary:(id)data {
    withoutSummary = YES;
    [self setData:data];
}

- (IBAction)itemClickedAtIndex:(id)sender {
    if ([_delegate respondsToSelector:@selector(cellItemClickedAtIndex:)]) {
        UIButton *btn = (UIButton *)sender;
        [_delegate cellItemClickedAtIndex:btn.tag];
    }
}

@end
