//
//  LoginTableViewCell.m
//  abhegios
//
//  Created by 180 on 15/1/19.
//  Copyright (c) 2015 180. All rights reserved.
//

#import "LoginTableViewCell.h"
#define kLeftOff 85
@implementation LoginTableViewCell
- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect =  [self.imageView frame];
    rect.origin.x = kLeftOff;
    [self.imageView setFrame:rect];
    rect =  [self.textLabel frame];
    rect.origin.x += kLeftOff;
    [self.textLabel setFrame:rect];
}

@end
