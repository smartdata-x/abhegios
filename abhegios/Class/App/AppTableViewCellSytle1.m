//
//  AppTableViewCellSytle1.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellSytle1.h"
#import "AppInfo.h"
@implementation AppTableViewCellSytle1

- (void)awakeFromNib {
    [[_logo layer] setCornerRadius:8.0f];
    [[_logo layer] setMasksToBounds:YES];
    [_setupButton.layer setMasksToBounds:YES];
    [_setupButton.layer setCornerRadius:8.0];
    [_setupButton.layer setBorderWidth:1.0];
    [_setupButton.layer setBorderColor:[kUIColorWithRGB(0xbcbcbc) CGColor]];//边框颜色
}

-(void) setData:(AppInfo*) appinfo
{
    [_name setText:[appinfo name]];
    [_summary setText:[appinfo summary]];
}

@end
