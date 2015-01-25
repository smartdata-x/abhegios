//
//  AppInfoViewStyle1.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppInfoViewStyle1.h"
#import "BaseInfo.h"
@implementation AppInfoViewStyle1

- (void)awakeFromNib
{
    [super awakeFromNib];
    [_setupButton.layer setMasksToBounds:YES];
    [_setupButton.layer setCornerRadius:8.0];
    [_setupButton.layer setBorderWidth:1.0];
    [_setupButton.layer setBorderColor:[ [[_setupButton titleLabel] textColor]CGColor]];//边框颜色
    
}


-(void) setData:(id)data
{
    [super setData:data];
    [_summary setText:[data summary]];
    //[_down setText:[NSString stringWithFormat:@"%@",[@([(AppInfo*)data down]) stringValue]]];
}

@end
