//
//  BookInfoViewStyle4.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookInfoViewStyle4.h"
#import "BookInfo.h"

@implementation BookInfoViewStyle4
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    [_mainInfoView setData:data];
    [_mainInfoView removeGestureRecognizer:_mainInfoView.tapGesture];
    NSString *follows = [NSString stringWithFormat:@"%ld关注", (long)[(BookInfo *)data follow]];
    [_summary setText:follows];
}
@end
