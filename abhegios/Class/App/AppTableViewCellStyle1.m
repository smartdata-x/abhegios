//
//  AppTableViewCellSytle1.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle1.h"
#import "AppInfo.h"
@implementation AppTableViewCellStyle1

- (void)awakeFromNib {
    [[_logo layer] setCornerRadius:8.0f];
    [[_logo layer] setMasksToBounds:YES];
    [_setupButton.layer setMasksToBounds:YES];
    [_setupButton.layer setCornerRadius:8.0];
    [_setupButton.layer setBorderWidth:1.0];
    [_setupButton.layer setBorderColor:[kUIColorWithRGB(0xbcbcbc) CGColor]];//边框颜色
}



-(void) setData:(id)data
{
    [super setData:data];
    [_name setText:[data name]];
    [_summary setText:[(AppInfo*)data summary]];
    [_down setText:[NSString stringWithFormat:@"%@",[@([(AppInfo*)data down]) stringValue]]];
}

@end
