//
//  BookStoreTableViewCellStyle3.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreTableViewCellStyle3.h"
#import "BookInfo.h"
#import "BookInfoGroup.h"
#import "BookInfoViewStyle1.h"

#define kMaxBookItemView 3
#define kBookItemWidth 108
#define kBookCellHeight 153

@implementation BookStoreTableViewCellStyle3

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.scrollView setFrame:self.frame];
    for (int i=0; i<kMaxBookItemView; i++) {
        [self addViewItem];
    }
}

- (void)addViewItem {
    CGFloat x = [[self subviews] count] * kBookItemWidth;
    BookInfoViewStyle1 *viewItem = [BookInfoViewStyle1 loadFromNib];
    CGRect rect = [viewItem frame];
    rect.origin.x = x;
    [viewItem setFrame:rect];
    [viewItem setTag:[[self subviews] count]];
    [self addSubview:viewItem];
}

- (void)setData:(id)data {
    [super setData:data];
    BookInfoGroup *bookInfoGroup = data;
    NSUInteger count = [[bookInfoGroup bookInfos] count];
    count = count > kMaxBookItemView ? kMaxBookItemView : count;
    [self setContentWidth:kBookItemWidth * count];
    NSUInteger i = 0;
    for (; i < count; ++i)
    {
        [[[self subviews] objectAtIndex:i] setData:[[bookInfoGroup bookInfos] objectAtIndex:i]];
    }
    for (; i < kMaxBookItemView; ++i) {
        [[[self subviews] objectAtIndex:i] setHidden:YES];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
