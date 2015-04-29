//
//  BeaconShakeView.m
//  abhegios
//
//  Created by yaobanglin on 15/4/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BeaconShakeView.h"
#import "BeaconShakeInfo.h"
#import "UIImageView+AFNetworking.h"
@implementation BeaconShakeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void) setData:(id) data
{
    [_name setText:[data name]];
    [_summary setText:[data intor]];
    [_logo setImageWithStrURL:[data pic]];
}
@end
