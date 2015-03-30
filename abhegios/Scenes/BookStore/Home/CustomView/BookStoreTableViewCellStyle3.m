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
@end

@implementation BookStoreTableViewCellStyle3

- (void)setShowParameters:(NSInteger)style {
    _cellStyle = style;
}

- (NSInteger) numberColumnCountHScrollView:(OEZHScrollView *)hScrollView {
    return MAX(3, [self.data count]);
}

- (CGFloat)hScrollView:(OEZHScrollView *)hScrollView widthForColumnAtIndex:(NSInteger)columnIndex {
    return kMainScreenWidth/3;
}

- (OEZHScrollViewCell *)hScrollView:(OEZHScrollView *)hScrollView cellForColumnAtIndex:(NSInteger)columnIndex {
    if (_cellStyle == 4) {
        static NSString *identifier = @"BookHScrollViewCell4";
        BookHScrollViewCell4 *cell = [hScrollView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[BookHScrollViewCell4 alloc] initWithReuseIdentifier:identifier];
        }
        [cell setData:[self.data objectAtIndex:columnIndex]];
        return cell;
    }
    else {
        static NSString *identifier = @"BookHScrollViewCell1";
        BookHScrollViewCell1 *cell = [hScrollView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[BookHScrollViewCell1 alloc] initWithReuseIdentifier:identifier];
        }
        [cell setData:[self.data objectAtIndex:columnIndex]];
        cell.delegate = self;
        return cell;
    }
    return nil;
}


- (void)hScrollView:(OEZHScrollView *)pageView didSelectColumnAtIndex:(NSInteger)columnIndex {
    [self didSelectRowColumn:columnIndex];
    if ([_delegate respondsToSelector:@selector(cellItemClickedAtIndex:)]) {
        [_delegate cellItemClickedAtIndex:columnIndex];
    }
}

- (void)didBookHScrollViewCell1Clicked:(id)clickedView {
    
    if ([_delegate respondsToSelector:@selector(cellItemClickedByView:)]) {
        [_delegate cellItemClickedByView:clickedView];
    }
}

- (IBAction)itemClickedAtIndex:(id)sender {
    if ([_delegate respondsToSelector:@selector(cellItemClickedAtIndex:)]) {
        UIButton *btn = (UIButton *)sender;
        [_delegate cellItemClickedAtIndex:btn.tag];
    }
}

@end