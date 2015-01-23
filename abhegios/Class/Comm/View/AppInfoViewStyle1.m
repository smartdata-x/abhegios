//
//  AppInfoViewStyle1.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppInfoViewStyle1.h"
#import "AppInfo.h"
@implementation AppInfoViewStyle1

- (void)awakeFromNib
{
    [super awakeFromNib];
    [_setup.layer setMasksToBounds:YES];
    [_setup.layer setCornerRadius:8.0];
    [_setup.layer setBorderWidth:1.0];
    [_setup.layer setBorderColor:[kUIColorWithRGB(0xbcbcbc) CGColor]];//边框颜色
    
}


-(void) setData:(id)data
{
    [super setData:data];
    [_summary setText:[(AppInfo*)data summary]];
    [_down setText:[NSString stringWithFormat:@"%@",[@([(AppInfo*)data down]) stringValue]]];
}

@end
