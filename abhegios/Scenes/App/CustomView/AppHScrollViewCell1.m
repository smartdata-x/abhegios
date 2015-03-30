//
//  AppHScrollViewCell1.m
//  abhegios
//
//  Created by 180 on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppHScrollViewCell1.h"
#import "AppInfoViewStyle3.h"
@implementation AppHScrollViewCell1
{
    AppInfoViewStyle3* _appInfoView;
}

-(id) initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if( self != nil)
    {
        _appInfoView = [AppInfoViewStyle3 loadFromNib];
        [self addSubview:_appInfoView];
    }
    return self;
}
-(void) setData:(id)data
{
    [_appInfoView setData:data];
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    [_appInfoView setFrame:[self bounds]];
}
@end
