//
//  FundTableViewHeader.m
//  abhegios
//
//  Created by 180 on 15/2/4.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "FundTableViewHeader.h"
#import "FoundHScrollViewCell.h"
@implementation FundTableViewHeader

-(void) awakeFromNib
{
    [super awakeFromNib];
    [_hScrollView setDelegate:self];
    [_hScrollView setScrollEnabled:NO];
    [_hScrollView reloadData];
    CALayer *layer = [[CALayer alloc] init];
    [layer setFrame:CGRectMake(0, CGRectGetHeight([_searchView frame]), kMainScreenWidth, 0.5)];
    [layer setBackgroundColor:[[UIColor colorWithWhite:0.5 alpha:0.5] CGColor]];
    [_searchView.layer addSublayer:layer];
}



-(NSInteger) numberColumnCountHScrollView:(OEZHScrollView *)hScrollView
{
    return 2;
}

-(CGFloat) hScrollView:(OEZHScrollView *)hScrollView widthForColumnAtIndex:(NSInteger)columnIndex
{
    return kMainScreenWidth/2;
}

-(OEZHScrollViewCell*) hScrollView:(OEZHScrollView *)hScrollView cellForColumnAtIndex:(NSInteger)columnIndex
{
    static NSString *identifier = @"FoundHScrollViewCell";
    FoundHScrollViewCell *cell = [hScrollView dequeueReusableCellWithIdentifier:identifier];
    if( columnIndex == 0)
        [[cell imageView] setImage:[UIImage imageNamed:@"you_fav_app"] ];
    else
         [[cell imageView] setImage:[UIImage imageNamed:@"you_fav_book"] ];
    return cell;
}
@end
