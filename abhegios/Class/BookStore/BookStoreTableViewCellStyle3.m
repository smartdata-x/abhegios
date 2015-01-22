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

@interface BookItemView : UIView
@property UIButton *logo;
@property UILabel *name;
@property UILabel *summary;
@end

@implementation BookItemView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _logo = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logo setFrame:CGRectMake(5, 5, frame.size.width - 10, frame.size.height - 10)];
        [_logo setImage:[UIImage imageNamed:@"app-icon-default"] forState:UIControlStateNormal];
        [self addSubview:_logo];
        
        _name = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, frame.size.width - 10, 21)];
        [_name setFont:[UIFont systemFontOfSize:14.0]];
        [_name setTextColor:[UIColor whiteColor]];
        [_name setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_name];
        
        _summary = [[UILabel alloc] initWithFrame:CGRectMake(5, frame.size.height - 36, frame.size.width - 10, 21)];
        [_summary setFont:[UIFont systemFontOfSize:14.0]];
        [_summary setTextColor:[UIColor whiteColor]];
        [_summary setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_summary];
    }
    return self;
}

- (void)setData:(BookInfo *)bookInfo {
    [_name setText:[bookInfo name]];
    [_summary setText:[bookInfo summary]];
    [self setHidden:NO];
}
@end

#define kMaxBookItemView 3
#define kBookItemWidth 100
#define kBookCellHeight 80

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
    BookItemView *viewItem = [[BookItemView alloc] initWithFrame:CGRectMake(x, 0, kBookItemWidth, kBookCellHeight)];
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
