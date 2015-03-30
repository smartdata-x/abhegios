//
//  AppInfoViewStyle1.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "InfoViewStyle.h"
#import "BaseInfo.h"
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"
@implementation InfoViewStyle

- (void)awakeFromNib
{
    [super awakeFromNib];
    [[_logo layer] setCornerRadius:8.0f];
    [[_logo layer] setMasksToBounds:YES];
    [_setupButton.layer setMasksToBounds:YES];
    [_setupButton.layer setCornerRadius:8.0];
    [_setupButton.layer setBorderWidth:1.0];
    [_setupButton.layer setBorderColor:[ [[_setupButton titleLabel] textColor]CGColor]];//边框颜色
    
}


-(void) setData:(id)data
{
    //[super setData:data];
     [self.name setText:[data name]];
    [_summary setText:[(BaseInfoMoreONS*)data summary]];
    [_down setText:[BaseInfoAdapter getPopularity:data]];
    [self.setupButton setTitle:[BaseInfoAdapter getButtonText:data] forState:UIControlStateNormal];
     [(UIImageView*)self.logo setImageWithStrURL:[BaseInfoAdapter getPic:data]];
}

@end
